import os
from io import BufferedWriter, FileIO

from datetime import datetime
from django.contrib.auth.models import User
from django.core.mail import send_mail
from django.core.mail.message import BadHeaderError
from rest_framework import viewsets
from rest_framework.decorators import list_route
from rest_framework.permissions import AllowAny
from rest_framework.response import Response

from carojobs.settings import MEDIA_ROOT, MEDIA_URL, MAX_UPLOAD_IMAGE_SIZE, MAX_UPLOAD_FILE_SIZE
from recruitment.models.Config import Config
from serializers import UserSerializer


# ViewSets define the view behavior.
from users.serializers import ConfigSerializer


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    @list_route(methods=['post'], permission_classes=[AllowAny, ])
    def upload(self, request):
        file_upload = request.FILES['file']

        # valid file
        # valid extension
        ext = os.path.splitext(file_upload.name)[1]
        valid_extensions = ['.pdf', '.doc', '.docx', '.jpg', '.png', '.xlsx', '.xls']
        if not ext.lower() in valid_extensions:
            return Response({'invalid': 'Error extensions', 'ext': ext.lower()}, 400)

        # valid content type
        content_type = file_upload.content_type
        valid_content_types = ['application/msword',
                               'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                               'application/vnd.ms-excel',
                               'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                               'application/pdf',
                               'image/jpeg',
                               'image/png']
        if not content_type.lower() in valid_content_types:
            return Response({'invalid': 'Error content type', 'content_type': content_type.lower()}, 400)

        # valid size
        size = file_upload.size
        image_extensions = ['.jpg', '.png']
        file_extensions = ['.pdf', '.doc', '.docx', '.xlsx', '.xls']
        if ext.lower() in image_extensions and size > MAX_UPLOAD_IMAGE_SIZE * 1024:
            return Response({'invalid': 'Image too large', 'size': size}, 400)
        if ext.lower() in file_extensions and size > MAX_UPLOAD_FILE_SIZE * 1024:
            return Response({'invalid': 'File too large', 'size': size}, 400)

        # upload
        today = datetime.now()
        today_path = today.strftime("/%Y/%m/%d")
        directory = MEDIA_ROOT + today_path
        file_name = '{}/{}'.format(today_path, file_upload.name)
        file_path = '{}/{}'.format(directory, file_upload.name)
        if not os.path.exists(directory):
            os.makedirs(directory)
        with BufferedWriter(FileIO(file_path, 'w')) as destination:
            for c in file_upload.chunks():
                destination.write(c)

        return Response({'uri': file_name,
                         'ext': ext.lower(),
                         'size': size / 1024,
                         'content_type': content_type})

    @list_route(methods=['post'], url_path='send-mail')
    def send_mail(self, request):
        subject = request.data.get('subject')
        message = request.data.get('message')
        email_form = request.data.get('from')
        email_to = request.data.get('to')

        if subject and message and email_to:
            try:
                send_mail(subject, message, email_form, email_to)
            except BadHeaderError:
                return Response({'detail': 'Invalid header found.'}, 400)
            return Response({'detail': 'success'})
        else:
            return Response({'detail': 'Error parameter.'}, 400)

    @list_route(methods=['get'], url_path='config')
    def get_config(self, request):
        config_type = request.query_params.get('type')
        if not config_type:
            config = Config.objects.all()
        else:
            config_types = config_type.split('|')
            config = Config.objects.all().filter(config_type__in=config_types)

        result = {}
        for c in config:
            if not result.has_key(c.config_type):
                result[c.config_type] = {'default': c.config_value, 'config': []}

            result[c.config_type]['config'].append({
                'id': c.config_value,
                'text': c.config_label,
                'value': c.config_value,
                'default': c.config_default
            })

            if c.config_default is True:
                result[c.config_type]['default'] = c.config_default

        return Response(result)

import datetime
import django_filters

from rest_framework import viewsets
from rest_framework.decorators import list_route
from rest_framework.permissions import AllowAny
from rest_framework.response import Response

from recruitment.models.Blog import Blog, BlogCategory

from recruitment.serializers.BlogSerializer import BlogSerializer, BlogCategorySerializer


class BlogPubViewSet(viewsets.ModelViewSet):
    queryset = Blog.objects.all().filter(deleted=0, active=True, public_date__lt=datetime.date.today())
    serializer_class = BlogSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)

    def get_permissions(self):
        if self.action in ['list', 'retrieve']:
            self.permission_classes = [AllowAny, ]

        return super(BlogPubViewSet, self).get_permissions()

    def update(self, request, *args, **kwargs):
        return Response({})

    def destroy(self, request, *args, **kwargs):
        return Response({})

    @list_route(methods=['get'], permission_classes=[AllowAny, ])
    def categories(self, request, *args, **kwargs):
        self.queryset = BlogCategory.objects.all().filter(deleted=0)
        self.serializer_class = BlogCategorySerializer
        return super(BlogPubViewSet, self).list(request, *args, **kwargs)

    @list_route(methods=['get'], url_path='hot-blog', permission_classes=[AllowAny, ])
    def hot_blog(self, request, *args, **kwargs):
        self.queryset = Blog.objects.all().filter(deleted=0, status='Hot')
        self.serializer_class = BlogSerializer
        return super(BlogPubViewSet, self).list(request, *args, **kwargs)

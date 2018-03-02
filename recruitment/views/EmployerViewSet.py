from rest_framework import viewsets, status
from rest_framework.decorators import detail_route, list_route
from rest_framework.response import Response
from rest_framework.permissions import AllowAny

from recruitment.models.Account import Account
from recruitment.serializers.EmployerSerializer import EmployerSerializer, EmployerEditSerializer
from recruitment.models.Employer import Employer, EmployerAccount
from django.contrib.auth.models import User

import django_filters
from recruitment.views.helpers import is_validate_account


class EmployerFilter(django_filters.rest_framework.FilterSet):
    name = django_filters.CharFilter(name='name', lookup_expr='contains')

    class Meta:
        model = Employer
        fields = ['name', 'email', 'phone']


class EmployerViewSet(viewsets.ModelViewSet):
    queryset = Employer.objects.all().filter(deleted=0)
    serializer_class = EmployerSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_class = EmployerFilter

    # def get_queryset(self):
    #     employer = Employer.objects.extra(
    #         select={
    #             'first_name': 'recruitment_employer.first_name',
    #             'last_name': 'recruitment_employer.last_name',
    #             'avatar': 'recruitment_employer.avatar',
    #             'email': 'recruitment_employer.email',
    #             'phone': 'recruitment_employer.phone',
    #             'company_name': 'recruitment_employer.name'
    #         }
    #     ).filter(deleted=0)
    #     # employer.query.join()
    #     return employer

    def get_serializer_class(self):
        serializer_class = self.serializer_class

        if self.request.method == 'PUT':
            serializer_class = EmployerEditSerializer

        return serializer_class

    def get_permissions(self):
        if self.action in ['create', 'create_link_account']:
            self.permission_classes = [AllowAny, ]

        return super(EmployerViewSet, self).get_permissions()

    def list(self, request, *args, **kwargs):
        user = request.user
        employers = Employer.objects.all().filter(deleted=0, user=user)
        serializer = EmployerSerializer(employers, many=True)
        return Response(serializer.data)

    def retrieve(self, request, *args, **kwargs):
        return self.profile(request)

    def create(self, request, *args, **kwargs):
        email = request.data.get('email')
        try:
            employer = Employer.objects.get(email=email)
            return Response({'detail': 'Duplicate email', 'email': employer.email}, 409)
        except Employer.DoesNotExist:
            pass

        return super(EmployerViewSet, self).create(request, *args, **kwargs)

    @list_route(methods=['post'], url_path='link-account')
    def create_link_account(self, request):
        account_id = request.data.get('account')
        if not account_id:
            return Response({'detail': 'Error account parameter'}, 400)

        serializer = EmployerSerializer(data=request.data)
        if serializer.is_valid():
            try:
                account = Account.objects.get(id=account_id)
            except Account.DoesNotExist:
                return Response({'detail': 'Can not found this account'}, 400)

            validated_data = serializer.validated_data

            # User save
            user = User(username=validated_data['user']['username'],
                        email=validated_data['email'],
                        first_name=validated_data['first_name'],
                        last_name=validated_data['last_name'])
            user.set_password(validated_data['user']['password'])
            user.save()
            # Employer save
            employer = Employer(first_name=validated_data['first_name'],
                                last_name=validated_data['last_name'],
                                avatar=validated_data['avatar'],
                                email=validated_data['email'],
                                phone=validated_data['phone'],
                                user=user)
            employer.save()
            EmployerAccount.objects.create(employer_id=employer.id, account_id=account.id, role='Member')
            return Response(EmployerEditSerializer(employer).data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def update(self, request, *args, **kwargs):
        return self.update_profile(request)

    def destroy(self, request, *args, **kwargs):
        # account = is_validate_account(request)
        # if account is False:
        #     return Response({'detail': 'Error account parameter'}, 400)
        #
        # employer = self.get_object()
        # employer.deleted = 1
        # employer.save()
        return Response({'detail': 'Can not found this employer'}, 400)

    @list_route()
    def profile(self, request):
        user = request.user
        employer = Employer.objects.get(user=user)
        serializer = EmployerSerializer(employer)
        return Response(serializer.data)

    @detail_route(methods=['put'])
    def update_profile(self, request):
        user = request.user
        employer = Employer.objects.get(user=user)
        serializer = EmployerEditSerializer(data=request.data)
        if serializer.is_valid():
            instance = serializer.update(employer, serializer.validated_data)
            return Response(EmployerEditSerializer(instance).data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @list_route(methods=['post'])
    def change_password(self, request):
        # get post data
        old_password = request.data.get('old_password')
        password = request.data.get('password')
        confirm_password = request.data.get('confirm_password')
        user = request.user
        # check
        if not old_password or not password or not confirm_password:
            return Response({'detail': 'Invalid parameters'}, status=status.HTTP_400_BAD_REQUEST)

        if not user.check_password(old_password):
            return Response({'detail': 'Invalid old password'}, status=status.HTTP_400_BAD_REQUEST)

        if password != confirm_password:
            return Response({'detail': 'Invalid confirm password'}, status=status.HTTP_400_BAD_REQUEST)

        user.set_password(password)
        user.save()
        return Response({'detail': True})

    @list_route(methods=['post'], url_path='invite')
    def add_to_account(self, request):
        account = is_validate_account(request)
        if account is False:
            return Response({'detail': 'Invalid account parameter'}, 400)

        email = request.data.get('email')

        if not email:
            return Response({'detail': 'Invalid email'}, 400)

        try:
            employer = Employer.objects.get(email=email)
        except:
            employer = None

        if employer is None:
            return Response({'status': 'NotAvailable'})

        return Response({'status': 'Available'})

    @list_route(methods=['post'], url_path='accept-invite')
    def accept_invite(self, request):
        account_id = request.data.get('account')
        if not account_id:
            return Response({'detail': 'Invalid account parameter'}, 400)

        account = Account.objects.get(id=account_id)
        user = request.user
        employer = Employer.objects.get(user=user)

        try:
            EmployerAccount.objects.create(employer_id=employer.id, account_id=account.id, role='Member')
            return Response({'detail': 'success'})
        except:
            return Response({'detail': 'Can not found this account'}, 400)            
from rest_framework import viewsets
from rest_framework.decorators import list_route
from rest_framework.permissions import AllowAny
from rest_framework.response import Response

import django_filters

from recruitment.models.Company import Company
from recruitment.serializers.CompanySerializer import CompanySerializer, CompanyCUDSerializer, CompanyDetailSerializer
from recruitment.views.helpers import is_validate_account


class CompanyFilter(django_filters.rest_framework.FilterSet):
    name = django_filters.CharFilter(name='name', lookup_expr='contains')

    class Meta:
        model = Company
        fields = ['name', 'account_id']


class CompanyViewSet(viewsets.ModelViewSet):
    queryset = Company.objects.all().filter(deleted=0)
    serializer_class = CompanySerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_class = CompanyFilter

    def get_serializer_class(self):
        serializer_class = self.serializer_class

        if self.action in ['create', 'update']:
            serializer_class = CompanyCUDSerializer

        if self.action in ['retrieve']:
            serializer_class = CompanyDetailSerializer

        return serializer_class

    def get_permissions(self):
        if self.action in ['list', 'retrieve', 'open_job_companies']:
            self.permission_classes = [AllowAny, ]

        return super(CompanyViewSet, self).get_permissions()

    # def list(self, request, *args, **kwargs):
    #     account = get_account(request)
    #     if account is None:
    #         return Response({})
    #
    #     companies = Company.objects.all().filter(account_id=account.id)
    #     serializer = CompanySerializer(companies)
    #     return Response(serializer.data)

    # def retrieve(self, request, *args, **kwargs):
    #     account = get_account(request)
    #     if account is None:
    #         return Response({})
    #
    #     return self.retrieve(request, *args, **kwargs)

    def create(self, request, *args, **kwargs):
        account = is_validate_account(request)
        if account is False:
            return Response({'detail': 'Error account parameter'}, 400)

        return super(CompanyViewSet, self).create(request, *args, **kwargs)

    def update(self, request, *args, **kwargs):
        account = is_validate_account(request)
        if account is False:
            return Response({'detail': 'Error account parameter'}, 400)

        company = self.get_object()
        account_related = company.account

        if account.id != account_related.id:
            return Response({'detail': 'Can not update this company'}, 400)

        return super(CompanyViewSet, self).update(request, *args, **kwargs)

    def destroy(self, request, *args, **kwargs):
        account = is_validate_account(request)
        if account is False:
            return Response({'detail': 'Error account parameter'}, 400)

        company = self.get_object()
        account_related = company.account
        if account.id != account_related.id:
            return Response({'detail': 'Can not delete this company'}, 400)

        company.deleted = 1
        company.save()

        return Response({'detail': 'Successful'})

    @list_route(methods=['get'], url_path='list-companies', permission_classes=[AllowAny, ])
    def open_job_companies(self, request):
        companies = Company.objects.filter(deleted=0, job_count__gt=0)
        serializer = CompanySerializer(companies, many=True)
        return Response(serializer.data)



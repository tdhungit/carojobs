from rest_framework import viewsets, status
from rest_framework.response import Response

from recruitment.models.Account import Account
from recruitment.models.Employer import Employer
from recruitment.serializers.AccountSerializer import AccountSerializer
from recruitment.views.helpers import is_validate_account

import django_filters


class AccountViewSet(viewsets.ModelViewSet):
    queryset = Account.objects.all().filter(deleted=0)
    serializer_class = AccountSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)

    def list(self, request, *args, **kwargs):
        user = request.user
        employer = Employer.objects.get(user=user)
        accounts = Account.objects.all().filter(deleted=0, employer__id=employer.id)

        queryset = self.filter_queryset(accounts)
        page = self.paginate_queryset(queryset)

        serializer = AccountSerializer(page, many=True)
        return self.get_paginated_response(serializer.data)

    def retrieve(self, request, *args, **kwargs):
        user = request.user
        employer = Employer.objects.get(user=user)
        account = Account.objects.get(*args, **kwargs)
        try:
            account_set = employer.account.get(id=account.id)
        except account.DoesNotExist:
            account_set = None
        except employer.DoesNotExist:
            account_set = None

        if account_set is None:
            return Response({})
        else:
            serializer = AccountSerializer(account_set)
            return Response(serializer.data)

    def create(self, request, *args, **kwargs):
        return Response({})

    def update(self, request, *args, **kwargs):
        user = request.user
        employer = Employer.objects.get(user=user)
        account = Account.objects.get(*args, **kwargs)
        try:
            account_set = employer.account.get(id=account.id)
        except account.DoesNotExist:
            account_set = None
        except employer.DoesNotExist:
            account_set = None

        if account_set is None:
            return Response({})
        else:
            serializer = AccountSerializer(data=request.data)
            if serializer.is_valid():
                instance = serializer.update(account_set, serializer.validated_data)
                return Response(AccountSerializer(instance).data)
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def destroy(self, request, *args, **kwargs):
        account = is_validate_account(request)
        if account is False:
            return Response({'detail': 'Error account parameter'}, 400)

        account.deleted = 1
        account.save()
        return Response({'detail': 'Successful'})


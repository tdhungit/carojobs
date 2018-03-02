from rest_framework import viewsets
from recruitment.serializers.MembershipSerializer import MembershipSerializer
from recruitment.models.Membership import Membership

import django_filters


class MembershipViewSet(viewsets.ModelViewSet):
    queryset = Membership.objects.all().filter(deleted=0)
    serializer_class = MembershipSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)

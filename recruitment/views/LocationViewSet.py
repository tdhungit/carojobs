from rest_framework import viewsets
from recruitment.serializers.LocationSerializer import LocationSerializer
from recruitment.models.Location import Location

import django_filters


class LocationViewSet(viewsets.ModelViewSet):
    queryset = Location.objects.all().filter(deleted=0)
    serializer_class = LocationSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)

import django_filters

from rest_framework import viewsets
from recruitment.models import Experience
from recruitment.serializers.ExperienceSerializer import ExperienceSerializer, ExperienceDetailSerializer


class ExperienceViewSet(viewsets.ModelViewSet):
    queryset = Experience.objects.all().filter(deleted=0)
    serializer_class = ExperienceSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)

    def get_serializer_class(self):
        if self.action in ['list']:
            serializer_class = ExperienceSerializer
        elif self.action in ['retrieve']:
            serializer_class = ExperienceDetailSerializer

        return serializer_class
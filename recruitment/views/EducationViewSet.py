import django_filters

from rest_framework import viewsets
from recruitment.models import Education
from recruitment.serializers.EducationSerializer import EducationSerializer, EducationDetailSerializer


class EducationViewSet(viewsets.ModelViewSet):
    queryset = Education.objects.all().filter(deleted=0)
    serializer_class = EducationSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)

    def get_serializer_class(self):
        if self.action in ['list']:
            serializer_class = EducationSerializer
        elif self.action in ['retrieve']:
            serializer_class = EducationDetailSerializer

        return serializer_class
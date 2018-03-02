import django_filters

from rest_framework import viewsets

from recruitment.models.Experience import ExperienceSkill
from recruitment.serializers.ExperienceSkillSerializer import ExperienceSkillSerializer, ExperienceSkillDetailSerializer


class ExperienceskillViewSet(viewsets.ModelViewSet):
    queryset = ExperienceSkill.objects.all().filter(deleted=0)
    serializer_class = ExperienceSkillSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)

    def get_serializer_class(self):
        if self.action in ['list']:
            serializer_class = ExperienceSkillSerializer
        elif self.action in ['retrieve']:
        	serializer_class = ExperienceSkillDetailSerializer    
        return serializer_class
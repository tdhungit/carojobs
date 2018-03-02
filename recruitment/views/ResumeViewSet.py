from rest_framework import viewsets

import django_filters
from rest_framework.response import Response

from recruitment.models.Candidate import Candidate
from recruitment.models.Education import Education
from recruitment.models.Experience import ExperienceSkill, Experience
from recruitment.models.Resume import Resume
from recruitment.serializers.ResumeSerializer import ResumeSerializer, ResumeReadSerializer


class ResumeViewSet(viewsets.ModelViewSet):
    queryset = Resume.objects.all().filter(deleted=0)
    serializer_class = ResumeSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)

    def get_serializer_class(self):
        serializer_class = self.serializer_class

        if self.action in ['retrieve']:
            serializer_class = ResumeReadSerializer

        return serializer_class

    def create(self, request, *args, **kwargs):
        user = request.user
        candidate = Candidate.objects.get(user=user)
        data = request.data
        data['candidate'] = candidate.id

        resume_serializer = ResumeSerializer(data=data)
        if resume_serializer.is_valid():
            resume_instance = resume_serializer.create(resume_serializer.validated_data)
            resume_id = resume_instance.id

            for skill in data['skill']:
                skill_add = ExperienceSkill(name=skill['name'], category=skill['category'],
                                        experience=skill['experience'], resume_id=resume_id)
                skill_add.save()
            for experience in data['experience']:
                experience_add = Experience(name=experience['name'], date_start=experience['date_start'],
                                            date_end=experience['date_end'], description=experience['description'],
                                            resume_id=resume_id)
                experience_add.save()
            for education in data['education']:
                education_add = Education(name=education['name'], date_start=education['date_start'],
                                          date_end=education['date_end'], description=education['description'],
                                          degree=education['degree'], resume_id=resume_id)
                education_add.save()

            return Response(ResumeSerializer(resume_instance).data)
        else:
            return Response(resume_serializer.errors, 500)

    def update(self, request, *args, **kwargs):
        user = request.user
        candidate = Candidate.objects.get(user=user)
        data = request.data

        if data['candidate']['id'] != candidate.id:
            return Response({'detail': 'Can not edit this resume'})

        data['candidate'] = candidate.id
        instance = self.get_object()

        resume_serializer = ResumeSerializer(data=data)
        if resume_serializer.is_valid():
            resume_instance = resume_serializer.update(instance, resume_serializer.validated_data)
            resume_id = resume_instance.id

            # delete relations
            ExperienceSkill.objects.filter(resume_id=resume_id).delete()
            Experience.objects.filter(resume_id=resume_id).delete()
            Education.objects.filter(resume_id=resume_id).delete()

            for skill in data['skill']:
                skill_add = ExperienceSkill(name=skill['name'], category=skill['category'],
                                        experience=skill['experience'], resume_id=resume_id)
                skill_add.save()
            for experience in data['experience']:
                experience_add = Experience(name=experience['name'], date_start=experience['date_start'],
                                            date_end=experience['date_end'], description=experience['description'],
                                            resume_id=resume_id)
                experience_add.save()
            for education in data['education']:
                education_add = Education(name=education['name'], date_start=education['date_start'],
                                          date_end=education['date_end'], description=education['description'],
                                          degree=education['degree'], resume_id=resume_id)
                education_add.save()

            return Response(ResumeSerializer(instance).data)
        else:
            return Response(resume_serializer.errors, 500)

    def list(self, request, *args, **kwargs):
        user = request.user
        self.queryset = Resume.objects.all().filter(deleted=0, candidate__user=user)
        return super(ResumeViewSet, self).list(request, *args, **kwargs)

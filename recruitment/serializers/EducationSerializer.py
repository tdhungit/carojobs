from rest_framework import serializers
from recruitment.models import Education, Resume


class ResumeField(serializers.ModelSerializer):
    class Meta:
        model = Resume
        fields = ('id', 'name', 'first_name', 'last_name', 'middle_name', 'email', 'phone', 'avatar')


class EducationSerializer(serializers.ModelSerializer):
    resume = ResumeField(read_only=True)

    class Meta:
        model = Education
        fields = ('id', 'name', 'date_start', 'date_end', 'degree', 'resume')


class EducationDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = Education
        fields = ('id', 'name', 'date_start', 'date_end', 'degree')

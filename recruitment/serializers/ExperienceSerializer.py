from rest_framework import serializers

from recruitment.models import Experience, Resume


class ResumeField(serializers.ModelSerializer):
    class Meta:
        model = Resume
        fields = ('id', 'name')


class ExperienceSerializer(serializers.ModelSerializer):
    resume = ResumeField(read_only=True)

    class Meta:
        model = Experience
        fields = ('id', 'name', 'date_start', 'date_end', 'resume')


class ExperienceDetailSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Experience
        fields = ('id', 'name', 'date_start', 'date_end')

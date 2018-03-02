from rest_framework import serializers

from recruitment.models import Resume
from recruitment.models.Experience import ExperienceSkill


class ResumeField(serializers.ModelSerializer):
    class Meta:
        model = Resume
        fields = ('id', 'name')


class ExperienceSkillSerializer(serializers.ModelSerializer):
    resume = ResumeField(read_only=True)

    class Meta:
        model = ExperienceSkill
        fields = ('id', 'name', 'category', 'resume')


class ExperienceSkillDetailSerializer(serializers.ModelSerializer):
    resume = ResumeField(read_only=True)

    class Meta:
        model = ExperienceSkill
        fields = ('id', 'name', 'category', 'resume')        
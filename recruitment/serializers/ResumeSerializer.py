from rest_framework import serializers

from recruitment.models.Candidate import Candidate
from recruitment.models.Education import Education
from recruitment.models.Experience import Experience, ExperienceSkill
from recruitment.models.Resume import Resume


class ExperienceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Experience
        fields = ('id', 'name',
                  'date_start',
                  'date_end',
                  'description')


class ExperienceSkillSerializer(serializers.ModelSerializer):
    class Meta:
        model = ExperienceSkill
        fields = ('id', 'name', 'category', 'experience')


class EducationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Education
        fields = ('id', 'name',
                  'date_start',
                  'date_end',
                  'degree',
                  'description')


class CandidateField(serializers.ModelSerializer):
    class Meta:
        model = Candidate
        fields = ('id', 'name')


class ResumeSerializer(serializers.ModelSerializer):
    candidate = CandidateField()

    class Meta:
        model = Resume
        fields = ('id', 'name', 'first_name', 'middle_name',
                  'last_name', 'avatar', 'email', 'phone',
                  'website', 'lnk_facebook', 'lnk_twitter', 'lnk_linkedin', 'lnk_tumlbr',
                  'status',
                  'country', 'city', 'address', 'description',
                  'candidate')


class ResumeReadSerializer(serializers.ModelSerializer):
    candidate = CandidateField()
    experienceskill_set = ExperienceSkillSerializer(many=True)
    experience_set = ExperienceSerializer(many=True)
    education_set = EducationSerializer(many=True)

    class Meta:
        model = Resume
        fields = ('id', 'name', 'first_name', 'middle_name',
                  'last_name', 'avatar', 'email', 'phone',
                  'website', 'lnk_facebook', 'lnk_twitter', 'lnk_linkedin', 'lnk_tumlbr',
                  'status',
                  'country', 'city', 'address', 'description',
                  'candidate', 'experienceskill_set', 'experience_set', 'education_set')

from django.contrib.auth.models import User
from rest_framework import serializers

from recruitment.models import Resume
from recruitment.models.Candidate import Candidate
from recruitment.models.Company import Company
from recruitment.models.Job import Job, JobCategory
from recruitment.models.Location import Location
from users.serializers import UserSerializer


class ResumeField(serializers.ModelSerializer):
    class Meta:
        model = Resume
        fields = ('id', 'name', 'first_name', 'last_name', 'avatar',
                  'email', 'phone', 'middle_name', 'candidate')


class LocationField(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = ('id', 'name')


class CompanyField(serializers.ModelSerializer):
    class Meta:
        model = Company
        fields = ('id', 'name')


class JobCategoryField(serializers.ModelSerializer):
    class Meta:
        model = JobCategory
        fields = ('id', 'name')


class JobField(serializers.ModelSerializer):
    location = LocationField(read_only=True)
    company = CompanyField(read_only=True)
    category = JobCategoryField(read_only=True)

    class Meta:
        model = Job
        fields = ('id', 'name', 'type', 'location', 'company', 'category')


class CandidateSerializer(serializers.ModelSerializer):
    email = serializers.EmailField()
    user = UserSerializer()

    class Meta:
        model = Candidate
        fields = ('id', 'first_name', 'last_name', 'avatar', 'email', 'status',
                  'phone', 'alternate_phone', 'birthday', 'user',
                  'address1', 'address2', 'state', 'city', 'post_code', 'country')

    def create(self, validated_data):
        user = User(username=validated_data['user']['username'],
                    email=validated_data['email'],
                    first_name=validated_data['first_name'],
                    last_name=validated_data['last_name'])
        user.set_password(validated_data['user']['password'])
        user.save()
        user_id = user.id

        candidate_data = {'first_name': validated_data['first_name'],
                          'last_name': validated_data['last_name'],
                          'avatar': validated_data['avatar'],
                          'email': validated_data['email'],
                          'user_id': user_id}
        candidate_data['name'] = candidate_data['first_name'] + ' ' + candidate_data['last_name']
        employer = Candidate.objects.create(**candidate_data)

        return employer


class CandidateEditSerializer(serializers.ModelSerializer):
    email = serializers.EmailField()

    class Meta:
        model = Candidate
        fields = ('id', 'first_name', 'last_name', 'avatar', 'email', 'status',
                  'phone', 'alternate_phone', 'birthday',
                  'address1', 'address2', 'state', 'city', 'post_code', 'country')


class CandidateDetailSerializer(serializers.ModelSerializer):
    email = serializers.EmailField()
    resume_set = ResumeField(read_only=True, many=True)
    job_set = JobField(read_only=True, many=True)
    user = UserSerializer()

    class Meta:
        model = Candidate
        fields = ('id', 'first_name', 'last_name', 'avatar', 'email', 'status',
                  'phone', 'alternate_phone', 'birthday', 'user', 'resume_set', 'job_set')

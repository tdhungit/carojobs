from rest_framework import serializers

from recruitment.models import Candidate, Account
from recruitment.models.Company import Company
from recruitment.models.Job import Job, JobCategory
from recruitment.models.Location import Location


class CompanyField(serializers.ModelSerializer):
    class Meta:
        model = Company
        fields = ('id', 'name', 'logo', 'website')


class CategoryField(serializers.ModelSerializer):
    class Meta:
        model = JobCategory
        fields = ('id', 'name')


class LocationField(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = ('id', 'name', 'email', 'phone',
                  'address1', 'address2', 'state', 'city', 'post_code', 'country')


class CandidateField(serializers.ModelSerializer):
    class Meta:
        model = Candidate
        fields = ('id', 'first_name', 'last_name', 'avatar', 'email', 'status',
                  'phone', 'alternate_phone', 'birthday',)


class JobSerializer(serializers.ModelSerializer):
    category = CategoryField(read_only=True)
    company = CompanyField(read_only=True)
    location = LocationField(read_only=True)

    class Meta:
        model = Job
        fields = ('id', 'name', 'category', 'detail', 'summary_1', 'summary_2', 'summary_3',
                  'created_date', 'company', 'location', 'type',
                  'salary_min', 'salary_max', 'salary_currency', 'salary_type')


class JobEditSerializer(serializers.ModelSerializer):
    class Meta:
        model = Job
        fields = ('id', 'name', 'category', 'detail', 'summary_1', 'summary_2', 'summary_3',
                  'company', 'location', 'type',
                  'salary_min', 'salary_max', 'salary_currency', 'salary_type')


class JobDetailSerializer(serializers.ModelSerializer):
    category = CategoryField(read_only=True)
    company = CompanyField(read_only=True)
    location = LocationField(read_only=True)

    class Meta:
        model = Job
        fields = ('id', 'name', 'detail', 'summary_1', 'summary_2', 'summary_3',
                  'category', 'company', 'location', 'type',
                  'salary_min', 'salary_max', 'salary_currency', 'salary_type')        


class JobCategorySerializer(serializers.ModelSerializer):
    job_count = serializers.IntegerField(read_only=True)

    class Meta:
        model = JobCategory
        fields = ('id', 'name', 'slug', 'job_count')


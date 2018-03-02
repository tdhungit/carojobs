from rest_framework import serializers

from recruitment.models import Account
from recruitment.models.Company import Company
from recruitment.models.Location import Location


class AccountField(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = ('id', 'name')


class CompanySerializer(serializers.ModelSerializer):
    account = AccountField()
    job_count = serializers.IntegerField(read_only=True)

    class Meta:
        model = Company
        fields = ('id', 'name', 'logo', 'description', 'email', 'phone',
                  'account', 'industry', 'number_employee', 'job_count',
                  'website', 'lnk_facebook', 'lnk_twitter', 'lnk_linkedin', 'lnk_tumblr',
                  'address1', 'address2', 'state', 'city', 'post_code', 'country')


class CompanyCUDSerializer(serializers.ModelSerializer):
    class Meta:
        model = Company
        fields = ('name', 'logo', 'description', 'email', 'phone', 'account')


class LocationField(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = ('id', 'name', 'email', 'phone', 'address1', 'address2',
                  'state', 'city', 'post_code', 'country')


class CompanyDetailSerializer(serializers.ModelSerializer):
    account = AccountField()
    location_set = LocationField(many=True, read_only=True)
    job_count = serializers.IntegerField(read_only=True)

    class Meta:
        model = Company
        fields = ('id', 'name', 'logo', 'description', 'email', 'phone',
                  'account', 'location_set', 'industry', 'number_employee', 'job_count',
                  'website', 'lnk_facebook', 'lnk_twitter', 'lnk_linkedin', 'lnk_tumblr',
                  'address1', 'address2', 'state', 'city', 'post_code', 'country')

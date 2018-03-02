from rest_framework import serializers
from recruitment.models.Location import Location
from recruitment.serializers.CompanySerializer import CompanySerializer


class LocationSerializer(serializers.ModelSerializer):
    email = serializers.EmailField()

    class Meta:
        model = Location
        fields = ('id', 'name', 'company', 'email', 'phone',
                  'address1', 'address2', 'state', 'city', 'post_code', 'country')


class LocationCompanySerializer(serializers.ModelSerializer):
    email = serializers.EmailField()
    company = CompanySerializer(read_only=True)

    class Meta:
        model = Location
        fields = ('id', 'name', 'company', 'email', 'phone',
                  'address1', 'address2', 'state', 'city', 'post_code', 'country')

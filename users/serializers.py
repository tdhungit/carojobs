from django.contrib.auth.models import User
from rest_framework import serializers

from recruitment.models.Config import Config


class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ('username', 'password')


class ConfigSerializer(serializers.ModelSerializer):
    class Meta:
        model = Config
        fields = ('id', 'config_type', 'config_label', 'config_value', 'config_default')

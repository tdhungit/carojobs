from rest_framework import serializers
from recruitment.models.Membership import Membership


class MembershipSerializer(serializers.ModelSerializer):
    class Meta:
        model = Membership
        fields = ('id', 'name', 'description', 'posts', 'users', 'views', 'rules')

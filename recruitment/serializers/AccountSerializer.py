from rest_framework import serializers
from recruitment.models.Account import Account
from recruitment.models.Employer import Employer
from recruitment.models.Membership import Membership


class EmployerField(serializers.ModelSerializer):
    class Meta:
        model = Employer
        fields = ('id', 'first_name', 'last_name', 'avatar', 'email', 'phone')


class MembershipField(serializers.ModelSerializer):
    class Meta:
        model = Membership
        fields = ('id', 'name', 'description', 'posts', 'users', 'views', 'rules', 'is_default')


class AccountSerializer(serializers.HyperlinkedModelSerializer):
    employer_set = EmployerField(many=True, read_only=True)
    membership = MembershipField(read_only=True)

    class Meta:
        model = Account
        fields = ('id', 'name', 'logo', 'description', 'email', 'phone', 'membership', 'employer_set',
                  'address1', 'address2', 'state', 'city', 'post_code', 'country',
                  'billing_address1', 'billing_address2',
                  'billing_state', 'billing_city', 'billing_post_code', 'billing_country')

from rest_framework import serializers
from recruitment.models.Employer import Employer, EmployerAccount
from recruitment.models.Account import Account
from recruitment.models.Company import Company
from users.serializers import UserSerializer
from django.contrib.auth.models import User


class AccountField(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = ('id', 'name', 'logo', 'description', 'email', 'phone')


class EmployerSerializer(serializers.ModelSerializer):
    email = serializers.EmailField()
    company_name = serializers.CharField(write_only=True)
    user = UserSerializer()
    account = AccountField(many=True, read_only=True)

    class Meta:
        model = Employer
        fields = ('id', 'first_name', 'last_name', 'avatar', 'email', 'phone', 'company_name', 'user', 'account')

    def create(self, validated_data):
        # membership default
        membership_id = 1

        # save user
        user = User(username=validated_data['user']['username'],
                    email=validated_data['email'],
                    first_name=validated_data['first_name'],
                    last_name=validated_data['last_name'])
        user.set_password(validated_data['user']['password'])
        user.save()
        user_id = user.id

        # get other params
        company_name = validated_data['company_name']

        # employer data
        employer_data = {'first_name': validated_data['first_name'],
                         'last_name': validated_data['last_name'],
                         'avatar': validated_data['avatar'],
                         'email': validated_data['email'],
                         'phone': validated_data['phone'],
                         'user_id': user_id}
        employer_data['name'] = employer_data['first_name'] + ' ' + employer_data['last_name']

        # account data
        account_data = {'name': company_name,
                        'logo': employer_data['avatar'],
                        'email': employer_data['email'],
                        'phone': employer_data['phone'],
                        'description': employer_data['name'],
                        'membership_id': membership_id}

        # company data
        company_data = {'name': company_name,
                        'logo': employer_data['avatar'],
                        'email': employer_data['email'],
                        'phone': employer_data['phone'],
                        'description': employer_data['name']}

        # save account & employer
        account = Account.objects.create(**account_data)
        employer = Employer.objects.create(**employer_data)
        EmployerAccount.objects.create(employer_id=employer.id, account_id=account.id, role='Administrator')
        # save company
        company_data['account_id'] = account.id
        Company.objects.create(**company_data)

        return employer

    def update(self, instance, validated_data):
        instance.name = validated_data['first_name'] + ' ' + validated_data['last_name']
        instance.first_name = validated_data.get('first_name', instance.first_name)
        instance.last_name = validated_data.get('last_name', instance.last_name)
        instance.avatar = validated_data.get('avatar', instance.avatar)
        instance.email = validated_data.get('email', instance.email)
        instance.phone = validated_data.get('phone', instance.phone)
        instance.save()
        return instance


class EmployerEditSerializer(serializers.ModelSerializer):
    email = serializers.EmailField()
    user = UserSerializer(read_only=True)

    class Meta:
        model = Employer
        fields = ('id', 'first_name', 'last_name', 'avatar', 'email', 'phone', 'user')

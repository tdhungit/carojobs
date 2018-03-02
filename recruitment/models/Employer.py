from __future__ import unicode_literals

from django.db import models
from carojobs.models import ModelBase
from recruitment.models.Account import Account
from django.contrib.auth.models import User


class Employer(ModelBase):
    name = models.CharField(max_length=200)
    avatar = models.CharField(max_length=200)
    email = models.CharField(unique=True, max_length=200)
    status = models.CharField(max_length=200)
    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    phone = models.CharField(max_length=200)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    account = models.ManyToManyField(Account, through='EmployerAccount')

    def __str__(self):
        return self.name


class EmployerAccount(ModelBase):
    employer = models.ForeignKey(Employer, on_delete=models.CASCADE)
    account = models.ForeignKey(Account, on_delete=models.CASCADE)
    role = models.CharField(max_length=200)

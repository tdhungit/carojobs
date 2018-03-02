from __future__ import unicode_literals

from django.contrib.auth.models import User
from django.db import models
from django.contrib import admin

from carojobs.models import ModelBase


class Candidate(ModelBase):
    name = models.CharField(max_length=200, null=True)
    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    avatar = models.CharField(max_length=200)
    email = models.EmailField(max_length=200)
    status = models.CharField(max_length=200, null=True)
    phone = models.CharField(max_length=200, null=True)
    alternate_phone = models.CharField(max_length=200, null=True)
    birthday = models.DateField(null=True)
    address1 = models.CharField(max_length=200, null=True)
    address2 = models.CharField(max_length=200, null=True)
    state = models.CharField(max_length=200, null=True)
    city = models.CharField(max_length=200, null=True)
    post_code = models.CharField(max_length=200, null=True)
    country = models.CharField(max_length=200, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.name


class CandidateAdmin(admin.ModelAdmin):
    list_display = ['first_name', 'last_name', 'email']

from __future__ import unicode_literals

from django.db import models
from django.contrib import admin
from carojobs.models import ModelBase
from recruitment.models.Account import Account


class Company(ModelBase):
    name = models.CharField(max_length=200)
    logo = models.CharField(max_length=200)
    description = models.TextField()
    email = models.CharField(max_length=200)
    phone = models.CharField(max_length=200)
    industry = models.CharField(max_length=200, null=True)
    number_employee = models.IntegerField(default=0)
    account = models.ForeignKey(Account, on_delete=models.CASCADE)
    address1 = models.CharField(max_length=200, null=True)
    address2 = models.CharField(max_length=200, null=True)
    state = models.CharField(max_length=200, null=True)
    city = models.CharField(max_length=200, null=True)
    post_code = models.CharField(max_length=200, null=True)
    country = models.CharField(max_length=200, null=True)
    billing_address1 = models.CharField(max_length=200, null=True)
    billing_address2 = models.CharField(max_length=200, null=True)
    billing_state = models.CharField(max_length=200, null=True)
    billing_city = models.CharField(max_length=200, null=True)
    billing_post_code = models.CharField(max_length=200, null=True)
    billing_country = models.CharField(max_length=200, null=True)
    website = models.CharField(max_length=200, null=True)
    lnk_facebook = models.CharField(max_length=200, null=True)
    lnk_twitter = models.CharField(max_length=200, null=True)
    lnk_linkedin = models.CharField(max_length=200, null=True)
    lnk_tumblr = models.CharField(max_length=200, null=True)
    job_count = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.name

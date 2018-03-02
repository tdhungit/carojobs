from __future__ import unicode_literals

from django.db import models
from django.contrib import admin
from carojobs.models import ModelBase
from recruitment.models.Company import Company


class Location(ModelBase):
    name = models.CharField(max_length=200)
    company = models.ForeignKey(Company, on_delete=models.CASCADE)
    email = models.CharField(max_length=200)
    phone = models.CharField(max_length=200)
    address1 = models.CharField(max_length=200, null=True)
    address2 = models.CharField(max_length=200, null=True)
    state = models.CharField(max_length=200, null=True)
    city = models.CharField(max_length=200, null=True)
    post_code = models.CharField(max_length=200, null=True)
    country = models.CharField(max_length=200, null=True)

    def __str__(self):
        return self.name


class LocationAdmin(admin.ModelAdmin):
    list_display = ['name', 'email', 'phone', 'address1', 'address2', 'state', 'city', 'country']


class LocationSetAdmin(admin.TabularInline):
    model = Location


class CompanyAdmin(admin.ModelAdmin):
    list_display = ['name', 'email', 'phone', 'website', 'city', 'country']
    inlines = (LocationSetAdmin, )

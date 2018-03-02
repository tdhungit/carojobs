from __future__ import unicode_literals

from django.contrib import admin
from django.db import models
from carojobs.models import ModelBase


class Membership(ModelBase):
    name = models.CharField(max_length=200)
    description = models.TextField()
    posts = models.IntegerField(default=0)
    users = models.IntegerField(default=0)
    views = models.IntegerField(default=0)
    rules = models.TextField()
    is_default = models.SmallIntegerField(default=0)

    def __str__(self):
        return self.name


class MembershipAdmin(admin.ModelAdmin):
    list_display = ['name', 'posts', 'users', 'views', 'rules', 'is_default']

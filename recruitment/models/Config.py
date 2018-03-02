from __future__ import unicode_literals

from django.contrib import admin
from django.db import models


class Config(models.Model):
    config_type = models.CharField(max_length=200)
    config_label = models.CharField(max_length=200, null=True)
    config_value = models.TextField()
    config_default = models.BooleanField(default=False)

    def __str__(self):
        return self.config_label


class ConfigAdmin(admin.ModelAdmin):
    list_display = ['config_type', 'config_label', 'config_value', 'config_default']

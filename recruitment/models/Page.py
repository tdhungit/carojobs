from django.db import models
from django.contrib import admin

from carojobs.models import ModelBase
from ckeditor.fields import RichTextField


class Page(ModelBase):
    name = models.CharField(max_length=200)
    slug = models.CharField(max_length=200)
    content = RichTextField()
    public_date = models.DateField()
    status = models.CharField(max_length=200, null=True)
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.name


class PageAdmin(admin.ModelAdmin):
    list_display = ['name', 'public_date', 'status', 'active']

from __future__ import unicode_literals

from django.db import models


class ModelBase(models.Model):
    created_date = models.DateTimeField('Date created record', auto_now_add=True)
    deleted = models.BooleanField(default=False)

    class Meta:
        abstract = True

    def save(self, *args, **kwargs):
        super(ModelBase, self).save(*args, **kwargs)

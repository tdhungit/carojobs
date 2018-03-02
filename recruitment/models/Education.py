from django.db import models

from carojobs.models import ModelBase
from recruitment.models.Resume import Resume


class Education(ModelBase):
    name = models.CharField(max_length=200)
    date_start = models.DateField()
    date_end = models.DateField()
    degree = models.CharField(max_length=200, null=True)
    description = models.TextField()
    resume = models.ForeignKey(Resume, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

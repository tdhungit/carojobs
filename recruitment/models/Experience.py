from django.db import models

from carojobs.models import ModelBase
from recruitment.models.Resume import Resume


class Experience(ModelBase):
    name = models.CharField(max_length=200)
    date_start = models.DateField()
    date_end = models.DateField()
    description = models.TextField(null=True)
    resume = models.ForeignKey(Resume, on_delete=models.CASCADE)

    def __str__(self):
        return self.name


class ExperienceSkill(ModelBase):
    name = models.CharField(max_length=200)
    category = models.CharField(max_length=200)
    experience = models.IntegerField(default=0)
    resume = models.ForeignKey(Resume, null=True, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

from __future__ import unicode_literals

from django.contrib import admin
from django.db import models
from django.db.models.expressions import F

from carojobs.models import ModelBase
from recruitment.models.Candidate import Candidate
from recruitment.models.Company import Company
from recruitment.models.Location import Location


class JobCategory(ModelBase):
    name = models.CharField(max_length=200)
    slug = models.CharField(max_length=200, null=True)
    job_count = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.name


class JobCategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'job_count']


class Job(ModelBase):
    name = models.CharField(max_length=200)
    category = models.ForeignKey(JobCategory, on_delete=models.CASCADE)
    detail = models.TextField()
    summary_1 = models.CharField(max_length=200)
    summary_2 = models.CharField(max_length=200)
    summary_3 = models.CharField(max_length=200)
    company = models.ForeignKey(Company, on_delete=models.CASCADE)
    location = models.ForeignKey(Location, on_delete=models.CASCADE)
    type = models.CharField(max_length=200)
    salary_min = models.IntegerField()
    salary_max = models.IntegerField()
    salary_currency = models.CharField(max_length=200, default='USD')
    salary_type = models.CharField(max_length=200, default='Monthly')
    candidate = models.ManyToManyField(Candidate, through='JobApply')

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        super(Job, self).save(*args, **kwargs)
        JobCategory.objects.filter(id=self.category_id).update(job_count=F('job_count') + 1)
        Company.objects.filter(id=self.company_id).update(job_count=F('job_count') + 1)


class JobAdmin(admin.ModelAdmin):
    list_display = ['name', 'location', 'type']


class JobApply(ModelBase):
    candidate = models.ForeignKey(Candidate, on_delete=models.CASCADE)
    job = models.ForeignKey(Job, on_delete=models.CASCADE)
    apply_date = models.DateField(auto_now_add=True)
    status = models.CharField(max_length=200)

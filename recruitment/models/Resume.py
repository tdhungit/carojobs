from django.db import models

from carojobs.models import ModelBase
from recruitment.models.Candidate import Candidate


class Resume(ModelBase):
    name = models.CharField(max_length=200)
    first_name = models.CharField(max_length=200)
    middle_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    avatar = models.CharField(max_length=200)
    email = models.EmailField(max_length=200)
    phone = models.CharField(max_length=200)
    website = models.CharField(max_length=200, null=True)
    lnk_facebook = models.CharField(max_length=200, null=True)
    lnk_twitter = models.CharField(max_length=200, null=True)
    lnk_linkedin = models.CharField(max_length=200, null=True)
    lnk_tumlbr = models.CharField(max_length=200, null=True)
    status = models.CharField(max_length=200, default='Active')
    country = models.CharField(max_length=200)
    city = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    description = models.TextField()
    candidate = models.ForeignKey(Candidate, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

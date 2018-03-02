"""carojobs URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from rest_framework import routers
from django.contrib import admin

from users.views import UserViewSet
from recruitment.views.ExperienceSkillViewSet import ExperienceskillViewSet
from recruitment.views.ExperienceViewSet import ExperienceViewSet
from recruitment.views.EducationViewSet import EducationViewSet
from recruitment.views.CandidateViewSet import CandidateViewSet
from recruitment.views.ResumeViewSet import ResumeViewSet
from recruitment.views.MembershipViewSet import MembershipViewSet
from recruitment.views.EmployerViewSet import EmployerViewSet
from recruitment.views.AccountViewSet import AccountViewSet
from recruitment.views.CompanyViewSet import CompanyViewSet
from recruitment.views.LocationViewSet import LocationViewSet
from recruitment.views.JobViewSet import JobViewSet, JobCategoryViewSet
from recruitment.views.frontend.JobPubViewSet import JobPubViewSet
from recruitment.views.frontend.BlogPubViewSet import BlogPubViewSet

router = routers.DefaultRouter()
# add view set
router.register(r'users', UserViewSet)
router.register(r'memberships', MembershipViewSet)
router.register(r'employers', EmployerViewSet)
router.register(r'accounts', AccountViewSet)
router.register(r'companies', CompanyViewSet)
router.register(r'locations', LocationViewSet)
router.register(r'jobs', JobViewSet)
router.register(r'candidates', CandidateViewSet)
router.register(r'resumes', ResumeViewSet)
router.register(r'educations', EducationViewSet)
router.register(r'experiences', ExperienceViewSet)
router.register(r'experiences-skill', ExperienceskillViewSet)
router.register(r'job-categories', JobCategoryViewSet)
router.register(r'pub/jobs', JobPubViewSet)
router.register(r'pub/blog', BlogPubViewSet)

# set url patterns
urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^administrator/', admin.site.urls),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^auth/', include('oauth2_provider.urls', namespace='oauth2_provider')),
]

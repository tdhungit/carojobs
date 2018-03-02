from django.contrib import admin

from recruitment.models.Account import Account, AccountAdmin
from recruitment.models.Job import JobCategory, JobCategoryAdmin, Job, JobAdmin
from recruitment.models.Company import Company
from recruitment.models.Location import CompanyAdmin
from recruitment.models.Membership import Membership, MembershipAdmin
from recruitment.models.Config import Config, ConfigAdmin
from recruitment.models.Candidate import Candidate, CandidateAdmin
from recruitment.models.Blog import BlogCategory, Blog, BlogCategoryAdmin, BlogAdmin
from recruitment.models.Page import Page, PageAdmin

fields = ('image_tag',)
readonly_fields = ('image_tag',)

admin.site.register(Account, AccountAdmin)
admin.site.register(Job, JobAdmin)
admin.site.register(JobCategory, JobCategoryAdmin)
admin.site.register(Company, CompanyAdmin)
admin.site.register(Membership, MembershipAdmin)
admin.site.register(Config, ConfigAdmin)
admin.site.register(Candidate, CandidateAdmin)
# admin.site.register(Location, LocationAdmin)
admin.site.register(BlogCategory, BlogCategoryAdmin)
admin.site.register(Blog, BlogAdmin)
admin.site.register(Page, PageAdmin)

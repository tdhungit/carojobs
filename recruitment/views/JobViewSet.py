import django_filters
from rest_framework import viewsets
from rest_framework.decorators import list_route
from rest_framework.response import Response

from recruitment.models.Candidate import Candidate
from recruitment.models.Company import Company
from recruitment.models.Employer import Employer
from recruitment.models.Job import Job, JobCategory
from recruitment.serializers.JobSerializer import JobSerializer, JobCategorySerializer, JobEditSerializer, \
    JobDetailSerializer

from recruitment.views.helpers import is_validate_account


class JobViewSet(viewsets.ModelViewSet):
    queryset = Job.objects.all().filter(deleted=0)
    serializer_class = JobSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)

    def get_serializer_class(self):
        serializer_class = self.serializer_class
        if self.action in ['create', 'update']:
            serializer_class = JobEditSerializer
        if self.action in ['retrieve']:
            serializer_class = JobDetailSerializer
        return serializer_class

    def update(self, request, *args, **kwargs):
        company_id = request.data.get('company')
        if not company_id:
            return Response({'detail': 'Error company parameter'}, 400)

        try:
            company = Company.objects.get(id=company_id)
        except Company.DoesNotExist:
            return Response({'detail': 'Can not found this company'}, 400)

        account = company.account

        user = request.user
        employer = Employer.objects.get(user=user)

        try:
            account_relate = employer.account.get(id=account.id)
        except:
            return Response({'detail': 'Can not found this company'}, 400)

        if account.id != account_relate.id:
            return Response({'detail': 'Can not update this company'}, 400)

        return super(JobViewSet, self).update(request, *args, **kwargs)

    def destroy(self, request, *args, **kwargs):
        account = is_validate_account(request)
        if account is False:
            return Response({'detail': 'Error account parameter'}, 400)

        job = self.get_object()
        account_related = job.company
        if account.id != account_related.account_id:
            return Response({'detail': 'Can not delete this jobs'}, 400)

        job.deleted = 1
        job.save()
        return Response({'detail': 'successful'})

    @list_route(methods=['get'], url_path='my-jobs')
    def my_jobs(self, request, *args, **kwargs):
        user = request.user
        candidate = Candidate.objects.get(user=user)

        if request.GET['only_id'] == '1':
            job_ids = Job.objects.values('id').filter(candidate=candidate)
            return Response(list(job_ids))

        self.queryset = Job.objects.all().filter(candidate=candidate)
        return super(JobViewSet, self).list(request, *args, **kwargs)


class JobCategoryViewSet(viewsets.ModelViewSet):
    queryset = JobCategory.objects.all().filter(deleted=0)
    serializer_class = JobCategorySerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)

    def update(self, request, *args, **kwargs):
        return Response({'detail': 'Error method'}, 400)

    def destroy(self, request, *args, **kwargs):
        return Response({'detail': 'Error method'}, 400)
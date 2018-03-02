import django_filters
from django.db.models.aggregates import Count

from rest_framework import viewsets
from rest_framework.decorators import list_route, detail_route
from rest_framework.permissions import AllowAny
from rest_framework.response import Response

from recruitment.models.Job import Job, JobCategory
from recruitment.models.Location import Location
from recruitment.serializers.JobSerializer import JobSerializer, JobCategorySerializer
from recruitment.serializers.LocationSerializer import LocationCompanySerializer


class JobPubViewSet(viewsets.ModelViewSet):
    queryset = Job.objects.all().filter(deleted=0)
    serializer_class = JobSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_fields = ('name', 'category__slug')

    def get_permissions(self):
        if self.action in ['list', 'retrieve']:
            self.permission_classes = [AllowAny, ]

        return super(JobPubViewSet, self).get_permissions()

    def list(self, request, *args, **kwargs):
        return super(JobPubViewSet, self).list(request, *args, **kwargs)

    @list_route(methods=['get'], permission_classes=[AllowAny, ])
    def categories(self, request):
        categories = JobCategory.objects.filter(deleted=0)
        serializer = JobCategorySerializer(categories, many=True)
        return Response(serializer.data)

    @list_route(methods=['get'], url_path='popular-companies', permission_classes=[AllowAny, ])
    def new_company_job(self, request):
        location_ids = Job.objects.filter(deleted=0).values('location_id').annotate(count=Count('location_id'))[:5]
        locations = []
        for location_id_one in location_ids:
            location_id = location_id_one.get('location_id')
            location = Location.objects.get(id=location_id)
            serializer = LocationCompanySerializer(location)
            data = serializer.data.copy()
            data['count'] = location_id_one.get('count')
            locations.append(data)
        return Response(locations)

    @list_route(methods=['get'], url_path='new-jobs', permission_classes=[AllowAny, ])
    def new_jobs(self, request):
        job = Job.objects.filter(deleted=0).order_by('-created_date')[0:5]
        serializer = JobSerializer(job, many=True)
        return Response(serializer.data)

    @detail_route(methods=['get'], url_path='company-jobs', permission_classes=[AllowAny, ])
    def company_jobs(self, request, pk, *args, **kwargs):
        company_id = pk
        jobs = Job.objects.filter(deleted=0, company_id=company_id)
        self.queryset = jobs
        return super(JobPubViewSet, self).list(request, *args, **kwargs)

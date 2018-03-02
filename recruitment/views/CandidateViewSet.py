import django_filters

from rest_framework import viewsets
from rest_framework.decorators import list_route
from rest_framework.permissions import AllowAny
from rest_framework.response import Response

from recruitment.models.Candidate import Candidate
from recruitment.models.Job import JobApply
from recruitment.serializers.CandidateSerializer import CandidateSerializer, CandidateEditSerializer, CandidateDetailSerializer


class CandidateViewSet(viewsets.ModelViewSet):
    queryset = Candidate.objects.all().filter(deleted=0)
    serializer_class = CandidateSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)

    def get_serializer_class(self):
        serializer_class = self.serializer_class

        if self.request.method == 'PUT':
            serializer_class = CandidateEditSerializer

        if self.action in ['retrieve']:
            serializer_class = CandidateDetailSerializer

        return serializer_class

    def get_permissions(self):
        if self.action in ['create']:
            self.permission_classes = [AllowAny, ]

        return super(CandidateViewSet, self).get_permissions()

    def create(self, request, *args, **kwargs):
        email = request.data.get('email')
        try:
            candidate = Candidate.objects.get(email=email)
            return Response({'detail': 'Duplicate email', 'email': candidate.email}, 409)
        except Candidate.DoesNotExist:
            pass

        return super(CandidateViewSet, self).create(request, *args, **kwargs)

    def update(self, request, *args, **kwargs):
        return Response({}, 400)

    def destroy(self, request, *args, **kwargs):
        return Response({}, 404)

    @list_route(methods=['get'])
    def profile(self, request):
        user = request.user
        candidate = Candidate.objects.get(user=user)
        serializer = CandidateSerializer(candidate)
        return Response(serializer.data)

    @list_route(methods=['put'])
    def update_profile(self, request):
        user = request.user
        candidate = Candidate.objects.get(user=user)
        serializer = CandidateEditSerializer(data=request.data)
        if serializer.is_valid():
            instance = serializer.update(candidate, serializer.validated_data)
            return Response(CandidateSerializer(instance).data)
        else:
            return Response(serializer.errors, 400)

    @list_route(methods=['get'], url_path='save-job')
    def save_job(self, request):
        user = request.user
        candidate = Candidate.objects.get(user=user)
        candidate_id = candidate.id
        job_id = request.GET['job_id']
        try:
            job_save = JobApply.objects.get(candidate_id=candidate_id, job_id=job_id)
        except JobApply.DoesNotExist:
            job_save = JobApply(candidate_id=candidate_id, job_id=job_id, status='Save')
            job_save.save()
        return Response({'id': job_id})

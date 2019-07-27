from django.conf.urls import url
from django.contrib import admin
from django.http import HttpResponse


def _admin_view(request):
    return HttpResponse(
        f'PATH_INFO: {request.path_info}\n' +
        f'REQUEST_URI: {request.META["REQUEST_URI"]}\n' +
        'admin view called! This is a security hole!\n',
        content_type='text/plain')


def _get_view(request, object_id):
    return HttpResponse(
        f'PATH_INFO: {request.path_info}\n' +
        f'REQUEST_URI: {request.META["REQUEST_URI"]}\n' +
        f'get view, object {object_id}\n',
        content_type='text/plain')


urlpatterns = [
    url(r'^admin/?', _admin_view),
    url(r'^get/(.+)$', _get_view),
]

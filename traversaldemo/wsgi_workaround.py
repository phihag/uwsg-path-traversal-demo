import os

import django
from django.core.handlers.wsgi import WSGIHandler

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "traversaldemo.settings")


# Workaround in Django: under uWSGI, calculate PATH_INFO ourselves
class UnmodifiedPathInfoWSGIHandler(WSGIHandler):
    def __call__(self, environ, start_response):
        if 'UWSGI_ROUTER' in environ:
            environ['PATH_INFO'] = environ['REQUEST_URI'].partition('?')[0]
        return super().__call__(environ, start_response)


django.setup(set_prefix=False)
application = UnmodifiedPathInfoWSGIHandler()  # noqa

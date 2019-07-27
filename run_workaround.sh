#!/bin/sh

exec pipenv run uwsgi --http 0.0.0.0:8124 --wsgi-file traversaldemo/wsgi_workaround.py

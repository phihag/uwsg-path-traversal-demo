#!/bin/sh

exec pipenv run uwsgi --http 0.0.0.0:8123 --wsgi-file traversaldemo/wsgi.py

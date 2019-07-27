# uWSGI path traversal demo

Demo for https://stackoverflow.com/q/57172511/35070



Run locally:

```sh
$ pip install pipenv
$ pipenv install
$ ./demo.sh
```

Build & run local docker image:

```
$ docker build -t uwsgi-path-traversal-demo .
$ docker run --rm uwsgi-path-traversal-demo
```

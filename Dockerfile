FROM python:3.7-buster AS build

RUN apt-get update -qq && apt-get install -qqy gcc libc6-dev
RUN pip install pipenv
WORKDIR /uwsgi-path-traversal-demo
COPY Pipfile Pipfile.lock ./
RUN pipenv install --dev

FROM python:3.7-buster
WORKDIR /uwsgi-path-traversal-demo
RUN apt-get update -qq && apt-get install -qqy curl
RUN pip install pipenv

COPY --from=build /root/.local/share/virtualenvs/ /root/.local/share/virtualenvs/
COPY . .

CMD ./demo.sh

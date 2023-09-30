FROM python:3.11.5-alpine3.18

ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PYTHONDONTWRITEBYTECODE=1 \
  # pip
  PIP_NO_CACHE_DIR=1 \
  PIP_DISABLE_PIP_VERSION_CHECK=1 \
  PIP_DEFAULT_TIMEOUT=100 \
  PIP_ROOT_USER_ACTION=ignore

WORKDIR /code

COPY ./requirements.txt /code/

RUN pip install -r requirements.txt

COPY . /code/

ENTRYPOINT gunicorn -k gevent --bind 0.0.0.0:5000 wsgi:app
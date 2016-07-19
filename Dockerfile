FROM python:3.5
MAINTAINER Takahiro Yaota <z@kuro.red>

RUN pip install --upgrade pip

ENV PLAYGROUND_ROOT /usr/local/playground

# app_env must be one of prod, dev or test
ARG playground_app_env="prod"
ENV PLAYGROUND_APP_ENV ${playground_app_env}

COPY requirements /tmp/requirements
RUN pip install -r "/tmp/requirements/$PLAYGROUND_APP_ENV.txt"

WORKDIR "$PLAYGROUND_ROOT"
COPY . "$PLAYGROUND_ROOT"

CMD ["gunicorn", "-c", "/usr/local/playground/gunicorn.config.py", "playground.wsgi"]

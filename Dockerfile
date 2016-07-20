FROM python:3.5
MAINTAINER Takahiro Yaota <z@kuro.red>

ENV PLAYGROUND_ROOT /usr/local/playground

# app_env must be one of prod, dev or test
ARG playground_app_env="prod"
ENV PLAYGROUND_APP_ENV ${playground_app_env}

COPY requirements "$PLAYGROUND_ROOT/requirements"
COPY scripts "$PLAYGROUND_ROOT/scripts"
RUN bash $PLAYGROUND_ROOT/scripts/playground-pip-install

WORKDIR "$PLAYGROUND_ROOT"
COPY . "$PLAYGROUND_ROOT"

CMD ["gunicorn", "-c", "/usr/local/playground/gunicorn.config.py", "playground.wsgi"]

# django-playground

[![Build Status](https://travis-ci.org/zakuro9715/django-playground.svg?branch=master)](https://travis-ci.org/zakuro9715/django-playground)
## System requirements

- Python 3.5 or later
- PostgreSQL or SQLite

Followings are required when using docker-compose

- docker
- docker-compose

Followings are not required but we reccomend.

- direnv

## Environment Variables

All environment variables for this playground are started with "PLAYGROUND_"

- PLAYGROUND_ROOT: Root directory of playground
- PLAYGROUND_APP_ENV: Playground environment. It must be one of "prod", "dev", or "test"
- PLAYGROUND_USE_SQLITE: Set 'yes' If you want to use sqlite3. If not, playground use postgresql

Followings are variables for postgresql. They are ignored when using sqlite3.

- PLAYGROUND_DATABASE_HOST: postgresql hostname
- PLAYGROUND_DATABASE_USER: postgresql username
- PLAYGROUND_DATABASE_PASSWORD: postgresql user password
- PLAYGROUND_DATABASE_NAME: postgresql database name
- PLAYGROUND_DATABASE_PORT: postgresql port

## Getting started

### docker-compose

- Run `docker-compose up` and access http://localhost:8000

### Local

Use sqlite3 by default. If you want to use postgresql, create .envrc-local like this.

```
export PLAYGROUND_USE_SQLITE=""
export PLAYGROUND_DATABASE_HOST="localhost"
export PLAYGROUND_DATABASE_USER="postgres"
export PLAYGROUND_DATABASE_PASSWORD="postgres"
export PLAYGROUND_DATABASE_NAME="playground"
export PLAYGROUND_DATABASE_PORT="5432"
```

- Run `direnv allow`
- Run `playground_pip_install`
- Run `python manage.py migrate`
- Run `gunicorn -c gunicorn.config.py playground.wsgi` and access http://localhost:8000

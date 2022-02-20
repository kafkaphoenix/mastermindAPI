#!/usr/bin/env bash

/srv/scripts/wait-for-it.sh database:5432

# Run migrations
python /srv/src/manage.py migrate

# Start django server
python /srv/src/manage.py runserver_plus 0.0.0.0:8000

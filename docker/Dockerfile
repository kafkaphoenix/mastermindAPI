FROM python:3.9 as base

ENV PYTHONPATH=/srv/src \
    APP_DIR=/srv \
    APP_USER="mastermind" \
    POETRY_VIRTUALENVS_CREATE=false

WORKDIR ${APP_DIR}

RUN pip install poetry

ARG UID=1000
ARG GID=1000

RUN (groupadd -g ${GID} -r ${APP_USER} \
    || groupmod --new-name ${APP_USER} `getent group ${GID} | cut --delimiter=: -f1`) \
    && useradd -u ${UID} -r -m \
    -g ${APP_USER} ${APP_USER} \
    -s /usr/sbin/nologin \
    --home-dir ${APP_DIR}

COPY pyproject.toml poetry.lock ./
RUN poetry install

ADD . ${APP_DIR}/

USER $APP_USER

WORKDIR ${APP_DIR}/src

EXPOSE 8000
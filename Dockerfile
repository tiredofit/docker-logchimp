FROM tiredofit/nginx:latest
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

ENV LOGCHIMP_VERSION=master \
    NGINX_WEBROOT=/app/server/public/

RUN apk update && \
    apk upgrade && \
    apk add -t .logchimp-build-deps \
                git \
                && \
    apk add -t .logchimp-run-deps \
                nodejs \
                yarn \
                postgresql-client \
                && \
    git clone https://github.com/logchimp/logchimp /app && \
    cd app && \
    git checkout ${LOGCHIMP_VERSION} && \
    yarn install && \
    yarn frontend:build && \
    apk del .logchimp-build-deps && \
    rm -rf /root/.cache /var/cache/apk/*

ADD install /

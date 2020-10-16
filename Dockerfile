FROM tiredofit/nodejs:14-alpine

ENV LOGCHIMP_VERSION=master
RUN apk update && \
    apk upgrade && \
    apk add -t .logchimp-build-deps \
                git \
                && \
    apk add -t .logchimp-run-deps \
                postgresql-client \
                && \
    git clone https://github.com/logchimp/logchimp /app && \
    cd app && \
    git checkout ${LOGCHIMP_VERSION} && \
    yarn install && \

    apk del .logchimp-build-deps && \
    rm -rf /root/.cache /var/cache/apk/*

ADD install /

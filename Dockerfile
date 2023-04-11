FROM php:8.2-cli-alpine

WORKDIR /app

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN set -x ; cd /app \
    && chmod +x /usr/local/bin/install-php-extensions \
    && install-php-extensions pcntl


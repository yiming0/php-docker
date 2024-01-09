FROM php:8.3-alpine AS app

WORKDIR /app

# https://github.com/mlocati/docker-php-extension-installer?tab=readme-ov-file#downloading-the-script-on-the-fly-with-add
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN set -xe && \
    chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions pdo_mysql


FROM app AS dev

RUN set -xe && \
    install-php-extensions @composer

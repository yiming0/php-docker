FROM php:8.3-alpine AS PHP

# https://github.com/mlocati/docker-php-extension-installer
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN set -xe && \
    chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions pdo pdo_mysql redis pcntl zip http && \

FROM PHP AS DEV

# https://github.com/ohmyzsh/ohmyzsh
ADD https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh /usr/local/bin/install-zsh.sh

RUN set -xe && \
    install-php-extensions @composer && \
    chmod +x /usr/local/bin/install-zsh.sh && \
    sh install-zsh.sh

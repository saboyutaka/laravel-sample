FROM php:7.2-alpine
LABEL maintainer "saboyutaka<yutaka.paradigm.shift@gmail.com>"

WORKDIR /tmp
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

RUN apk --no-cache add \
        git \
        curl-dev \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libxml2-dev \
        zlib-dev && \
    NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
    docker-php-ext-install -j${NPROC} \
        curl \
        dom \
        mbstring \
        pdo \
        pdo_mysql \
        simplexml \
        zip && \
    docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ && \
    docker-php-ext-install -j${NPROC} gd && \
    mkdir -p /var/run/php-fpm && \
    chown root:root /var/run/php-fpm

RUN apk add --no-cache $PHPIZE_DEPS && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug

RUN composer global require "laravel/installer" && \
    composer self-update && \
    composer global require hirak/prestissimo

RUN mkdir -p /app
WORKDIR /app

FROM php:7.3
LABEL maintainer "saboyutaka<yutaka.paradigm.shift@gmail.com>"

RUN apt-get update -qq && \
 apt-get install -y --no-install-recommends \
  build-essential \
  zip \
  unzip \
  git \
  libfontconfig1 && \
  rm -rf /var/lib/apt/lists/*

COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

RUN pecl install xdebug && \
    docker-php-ext-enable xdebug

RUN mkdir -p /app
WORKDIR /app

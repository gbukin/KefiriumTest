FROM php:8.2.8-fpm-alpine3.18

ENV PHP_VERSION=8.2.8

RUN addgroup -S -g 1000 www \
 && adduser -S -D -u 1000 -s /sbin/nologin -h /app -G www www

RUN apk add --update --no-cache \
	supervisor \
	nginx \
	curl-dev \
	nodejs \
	npm \
	libpq-dev \
	bash \
    git

RUN docker-php-ext-install pdo_pgsql pgsql curl \
    && docker-php-ext-enable pdo_pgsql \
    && rm -rf /var/cache/apk/*

RUN curl -s https://getcomposer.org/installer | php \
    && alias composer='php composer.phar' && mv composer.phar /usr/bin/composer

EXPOSE 9000/tcp

EXPOSE 443 80

WORKDIR /app

#CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

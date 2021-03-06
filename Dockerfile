FROM php:7.4-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php -- \
        --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
COPY . .
RUN COMPOSER_VENDOR_DIR="/srv/vendor" composer instal

CMD php artisan serve --host=0.0.0.0
# from https://backdropcms.org/requirements
FROM php:7.4-apache

RUN a2enmod rewrite

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libzip-dev libonig-dev libpng-dev libjpeg-dev libpq-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-jpeg=/usr \
	&& docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql zip

WORKDIR /var/www/html
RUN ls
# https://github.com/backdrop/backdrop/releases
ENV BACKDROP_VERSION 1.20.0
# ENV BACKDROP_MD5 68c4caabd52535896009e0d6d26e1040
# RUN mkdir files
RUN curl -fSL "https://github.com/backdrop/backdrop/archive/${BACKDROP_VERSION}.tar.gz" -o backdrop.tar.gz \
  # && echo "${BACKDROP_MD5} *backdrop.tar.gz" | md5sum -c - \
  && tar -xz --strip-components=1 -f backdrop.tar.gz \
  && rm backdrop.tar.gz \
  && chown -R www-data:www-data sites \
  && chmod 777 files 
  # && chown -R www-data:www-data files

# Add custom entrypoint to set BACKDROP_SETTINGS correctly
COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]

# FROM alpine:3.16
# 
# RUN apk update && \
#     apk add curl mariadb-client redis php7 php7-phar php7-json php7-curl php7-fpm php7-mysqli php7-iconv && \
#     wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && \
#     chmod +x /usr/bin/dumb-init && \
#     mkdir -p /var/www/wordpress && \
#     curl -s -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp && \
#     chmod +x /usr/bin/wp && \
#     wp core download --version=5.8.1 --path=/var/www/wordpress

# Base image
FROM debian:buster

# Install required packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    php7.3-fpm \
    php7.3-mysql \
    php7.3-gd \
    php7.3-curl \
    php7.3-xml \
    php7.3-mbstring \
    php7.3-imagick \
    php7.3-zip \
    mariadb-client
#   && rm -rf /var/lib/apt/lists/*    -> Elimina la cache delle installazioni
RUN apt-get clean

# Install WordPress
RUN curl -L -O https://wordpress.org/latest.tar.gz \
    && tar xzvf latest.tar.gz \
    && rm latest.tar.gz

# Crea la cartella d'appoggio (cambiabile) 
# e dà i permessi totali ai servizi web attraverso il gruppo e l'utente www-data.
# La flag -R concede i permessi anche nelle sottocartelle e file.
RUN mkdir -p /var/www/html/wordpress
RUN chown -R www-data:www-data /var/www/html/wordpress

COPY conf/index.html /tmp/index.html

# Set working directory
WORKDIR /var/www/html/wordpress

# Cartella dove vengono inserite automaticamente le info sul PID (/run/php/php7.3-fpm.pid). 
# Necessita dei permessi.
RUN mkdir -p /run/php \
    && chown -R www-data:www-data /run/php


# Inserisce il file conf. per PHP-FPM nella cartella apposita
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY /tools/config.sh /var/www/html/wordpress/

# Expose ports
EXPOSE 9000
ENTRYPOINT ["/var/www/html/wordpress/config.sh"]
# Start services
CMD ["php-fpm7.3"]

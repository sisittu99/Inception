FROM alpine:3.16
#redis è un servizio bonus.
#installa una serie di pacchetti necessari per il funzionamento di 
#WordPress, tra cui PHP 7, il supporto per il database MariaDB, Redis per la 
#cache e altri pacchetti necessari per l'esecuzione di WordPress.
#scarica il binario di dumb-init, un'inizializzazione del processo per migliorare 
#la gestione dei processi figli e il segnale di chiusura del container.
#si imposta il punto di ingresso del contenitore utilizzando dumb-init come processo principale.
RUN apk update && \
    apk add curl mariadb-client redis php7 php7-phar php7-json php7-curl php7-fpm php7-mysqli php7-iconv && \
    wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && \
    chmod +x /usr/bin/dumb-init && \
    mkdir -p /var/www/wordpress && \
    curl -s -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp && \
    chmod +x /usr/bin/wp && \
    wp core download --version=5.8.1 --path=/var/www/wordpress
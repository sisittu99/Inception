FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get install -y openssl 

RUN mkdir /etc/nginx/ssl && \
    openssl req -newkey rsa:2048 \
        -x509 \
        -days 365 \
		-nodes \
		-keyout /etc/nginx/ssl/inception.key \
		-out /etc/nginx/ssl/inception.crt \
		-sha256 -new -sha256 \
		-subj "/C=IT/ST=Lazio/L=Rome/O=PDC/CN=alazzari.42.fr"

RUN mkdir -p /var/log/custom_logs/nginx && touch error.log access.log

COPY index.html /var/www/html
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

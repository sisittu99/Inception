FROM alpine:3.16

RUN apk update && \
    apk install -y nginx && \
    apk install -y openssl 

RUN mkdir /etc/nginx/ssl && \
    openssl req -newkey rsa:2048 \
        -x509 \
        -days 365 \
		-nodes \
		-keyout /etc/nginx/ssl/inception.key \
		-out /etc/nginx/ssl/inception.crt \
		-sha256 -new -sha256 \
		-subj "/C=IT/ST=Lazio/L=Rome/O=PDC/CN=alazzari.42.fr"

COPY index.html /var/www/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

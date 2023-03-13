FROM alpine:3.16

RUN apk update && apk upgrade && apk add nginx openssl 
RUN rm -f /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
#COPY content /usr/share/nginx/html

RUN cd /etc/nginx && mkdir -p ssl && touch /etc/nginx/ssl/inception.key && \
	touch /etc/nginx/ssl/inception.csr && \
		openssl req -newkey rsa:2048 \
		-nodes \
		# esplicita la non creazione di una passphrase per la chiave privata ("No Data Encrypt. Standard")
		-keyout /etc/nginx/ssl/inception.key \
		# chiave privata
		-out /etc/nginx/ssl/inception.csr \
		# richiesta della creazione del certificato. Serve in caso di richiesta da fare al Certificate Authority (CA). NGINX la usa.
		-sha256 -new -sha256 \
		# protocolli supportati
		-subj "/C=IT/ST=Lazio/L=Rome/O=PDC/CN=mcerchi"

RUN mkdir -p /var/log/custom_logs/nginx && touch /var/log/custom_logs/nginx/access.log /var/log/custom_logs/nginx/error.log

COPY conf/nginx.conf /etc/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]

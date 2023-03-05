FROM alpine:3.16

RUN apk update -y && apk upgrade -y && apk add nginx openssl -y
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
#COPY content /usr/share/nginx/html
COPY conf /etc/nginx

EXPOSE 443

FROM nginx

COPY ssl/localhost.crt /etc/nginx/ssl/
COPY ssl/localhost.key /etc/nginx/ssl/

COPY index.html /usr/share/nginx/html/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
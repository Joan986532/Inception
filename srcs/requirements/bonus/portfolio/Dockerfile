FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install nginx -y

COPY tools/portfolio.html /var/www/html
COPY conf/nginx.conf /etc/nginx/nginx.conf

STOPSIGNAL SIGQUIT

EXPOSE 8081

CMD ["nginx", "-g", "daemon off;"]

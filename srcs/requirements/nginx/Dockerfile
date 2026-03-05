FROM debian:bookworm

RUN apt update && apt -y upgrade && apt install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=jnauroy.42.fr/UID=jnauroy"

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443
EXPOSE 8081
EXPOSE 8080

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]

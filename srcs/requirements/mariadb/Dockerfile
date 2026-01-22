FROM debian:bookworm

RUN apt update && apt upgrade -y && apt-get install -y mariadb-server mariadb-client

RUN mkdir -p /etc/myslq/mariadb.conf.d
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir ./entrypoint-initdb.d

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld

EXPOSE 3306

COPY ./tools/entrypoint.sh ./
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
CMD ["mysqld"]

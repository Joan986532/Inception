FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y vsftpd

COPY tools/script.sh /
COPY conf/vsftpd.conf /etc/vsftpd.conf

RUN chmod +x ./script.sh

ENTRYPOINT ["./script.sh"]

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]

FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install vsftpd -y

RUN mkdir -p /var/run/vsftpd/empty

COPY ./conf/vsftpd.conf /etc/vstpdf/vsftpd.conf
COPY ./tools/script.sh .
RUN chmod +x script.sh

ENTRYPOINT ["/script.sh"]
CMD ["vsftpd"]

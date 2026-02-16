FROM public.ecr.aws/debian/debian:bookworm
RUN apt update -y && apt upgrade -y && apt install -y vsftpd

COPY tools/script.sh /
COPY conf/vstfpd.conf /etc/vstfpd.conf

RUN chmod +x ./script.sh

CMD ["./script.sh"]

FROM alpine:3 as build
RUN apk update && apk add libtool autoconf automake m4 pkgconfig gawk musl-dev mariadb-dev linux-pam-dev make gcc gzip tar curl
RUN curl -L  https://github.com/NigelCunningham/pam-MySQL/archive/v0.8.1.tar.gz -o /root/pam-mysql.tar.gz
RUN mkdir -p /root/pam-mysql && tar xvf /root/pam-mysql.tar.gz -C /root/pam-mysql --strip-components 1
RUN cd /root/pam-mysql && autoreconf -i && ./configure && make install && strip /lib/security/pam_mysql.so

FROM alpine:3
RUN apk add --no-cache mariadb-connector-c tzdata linux-pam vsftpd gettext
ENV TZ Asia/Shanghai

COPY --from=build /lib/security/pam_mysql.so /lib/security/pam_mysql.so
COPY vsftpd.sh /usr/sbin/
COPY vsftpd.conf.tpl vsftpd.mysql.tpl /config/

ENV LISTEN_PORT 21
ENV PASV_ENABLE YES
ENV PASV_MAX_PORT 0
ENV PASV_MIN_PORT 0

CMD ["/usr/sbin/vsftpd.sh"]

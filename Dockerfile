FROM sysdignathan/secure-squid

WORKDIR /etc/squid/

RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN apk update && \
  apk add apache2-utils openssl

COPY squid.conf /etc/squid/

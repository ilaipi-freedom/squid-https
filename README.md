## base

[sysdignathan/secure-squid](https://hub.docker.com/repository/docker/sysdignathan/secure-squid)


## Usage

```shell
# create user
# replace xxx of the end to your username
docker run --rm -it -v $PWD/certs:/etc/squid/certs ilaipi/squid-https htpasswd -c /etc/squid/certs/passwords xxx

## generate cert
docker run --rm -it -v $PWD/certs:/etc/squid/certs -w /etc/squid/certs ilaipi/squid-https openssl genrsa -out proxy.key 2048
docker run --rm -it -v $PWD/certs:/etc/squid/certs -w /etc/squid/certs ilaipi/squid-https openssl req -new -key proxy.key -out proxy.csr
docker run --rm -it -v $PWD/certs:/etc/squid/certs -w /etc/squid/certs ilaipi/squid-https openssl x509 -req -days 365 -in proxy.csr -signkey proxy.key -out proxy.crt

docker run --restart always --name squid-container -v $PWD/certs:/etc/squid/certs -p 30128:3128 -p 30129:3129 ilaipi/squid-https
```

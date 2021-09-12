FROM alpine:3.13

RUN apk update && apk upgrade

#パッケージをキャッシュしなくするオプション
#通常、ダウンロードされたパッケージは /var/cache/apk にキャッシュされる
#DockerでImageサイズを削減するために RUN rm -rf /var/cache/apk とかしなくて良いので便利
RUN apk --no-cache add apache2 apache2-ssl openssl

RUN apk --no-cache add php7 php7-apache2 php7-openssl php7-mbstring


COPY index.html /var/www/localhost/htdocs
COPY test.php /var/www/localhost/htdocs

EXPOSE 80

CMD /usr/sbin/httpd -D FOREGROUND
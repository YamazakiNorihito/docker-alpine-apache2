$ docker build -t alpine_apache2 .
[+] Building 14.1s (11/11) FINISHED
=> [internal] load build definition from Dockerfile 0.1s
=> => transferring dockerfile: 630B 0.0s
=> [internal] load .dockerignore 0.1s
=> => transferring context: 2B 0.0s
=> [internal] load metadata for docker.io/library/alpine:3.13 3.5s
=> CACHED [1/6] FROM docker.io/library/alpine:3.13@sha256:2582893dec6f12fd499d3a709477f2c0c0c1dfcd28024c93f1f0626b9e3540c 0.0s
=> [internal] load build context 0.2s
=> => transferring context: 58B 0.0s
=> [2/6] RUN apk update && apk upgrade 3.2s
=> [3/6] RUN apk --no-cache add apache2 apache2-ssl openssl 2.5s
=> [4/6] RUN apk --no-cache add php7 php7-apache2 php7-openssl php7-mbstring 3.3s
=> [5/6] COPY index.html /var/www/localhost/htdocs 0.2s
=> [6/6] COPY test.php /var/www/localhost/htdocs 0.2s
=> exporting to image 0.6s
=> => exporting layers 0.5s
=> => writing image sha256:515069f674bdd4a66997839ea55a0db55f340e786fc2affe421192f0205ec267 0.0s
=> => naming to docker.io/library/alpine_apache2 0.1s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them

$ docker run --rm -itd -p 8080:80 --name AL04 alpine_apache2
eb7dd09fe6dc4334bf5c189767e5f14c2491284f0669a4cea00573fb5a79c006

# http://localhost:8080

# http://localhost:8080/test.php

$ docker stop AL04
AL04

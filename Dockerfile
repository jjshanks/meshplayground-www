FROM kyma/docker-nginx

COPY www/ /var/www
COPY default /etc/nginx/sites-enabled/default
COPY certs /etc/nginx/ssl/

ADD VERSION .

CMD 'nginx'

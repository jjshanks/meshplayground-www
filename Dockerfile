FROM kyma/docker-nginx

COPY www/ /var/www
COPY default /etc/nginx/sites-enabled/default

COPY certs /etc/nginx/ssl/
RUN ln -s /etc/nginx/sites-available/default-ssl /etc/nginx/sites-enabled/default-ssl

CMD 'nginx'


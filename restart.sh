docker stop www && docker rm www && docker run --restart always --name www -p 80:80 -p 443:443 -d docker.meshplayground.com/www.meshplayground.com:latest

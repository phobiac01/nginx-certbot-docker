FROM nginx:alpine
RUN apk add python3 python3-dev py3-pip build-base libressl-dev musl-dev libffi-dev
RUN pip3 install pip --upgrade
RUN pip3 install certbot-nginx
RUN mkdir /etc/letsencrypt
COPY ./sites/ /etc/nginx/sites-available
COPY nginx.conf /etc/nginx/nginx.conf

RUN { crontab -l; echo "0       0       1       *       *       /usr/bin/certbot renew --quiet"; } | crontab -

# docker run -v letsencrypt:/etc/letsencrypt -v $(pwd)/nginx-confs:/etc/nginx/sites-available -v $(pwd)/sites:/var/www/  --name Nginx-Certbot -ti -p 80:80 -p 443:443 nginx-certbot sh
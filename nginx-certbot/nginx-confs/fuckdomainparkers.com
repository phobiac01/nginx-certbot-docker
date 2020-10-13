server {
    server_name  .fuckdomainparkers.com;

    location / {
        root   /var/www/fuckdomainparkers.com/;
        index  index.html index.htm;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/fuckdomainparkers.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/fuckdomainparkers.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot


}server {
    if ($host = www.fuckdomainparkers.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = fuckdomainparkers.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen       80;
    server_name  .fuckdomainparkers.com;
    return 404; # managed by Certbot




}
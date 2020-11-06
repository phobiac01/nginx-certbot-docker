# Replace all instances of example.com with coresponding site names and folders
# 'Sites' dir will be linked to /var/www/ when starting the container
# Copy and modify this file for each site you want to host

server {
    server_name  .example.com;

    location / {
	root   /var/www/example.com/;
        index  index.html index.htm;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    listen 80;
}

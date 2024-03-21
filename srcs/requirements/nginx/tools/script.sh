#!/bin/bash



openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/privatekey.key -out /etc/ssl/certs/certificate.crt -subj "/C=PT/L=Lisboa/O=42Lisboa/OU=Student/CN=mtiago-s.42.fr"


echo '
server {
    listen 443 ssl default_server;
    listen [::]:443 ssl default_server;
    server_name mtiago-s.42.fr www.mtiago-s.42.fr;

    ssl_certificate /etc/ssl/certs/certificate.crt;
    ssl_certificate_key /etc/ssl/private/privatekey.key;
    ssl_protocols TLSv1.3;

    index index.php index.htm index.html;

    # Sets the document root for the server
    root /var/www/html/;

    # Defines a location block that matches requests ending in .php
    location ~ \.php$ {
        try_files $uri /index.php =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass   wordpress:9000;
        fastcgi_index  index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
    }' > /etc/nginx/sites-available/default



#     index index.php;
#     root /var/www/html;

#     location ~ [^/]\.php(/|$) { 
#             try_files $uri =404;
#             fastcgi_pass wordpress:9000;
#             include fastcgi_params;
#             fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
#         }
# }' >>  /etc/nginx/sites-available/default

echo ola

nginx -g "daemon off;"
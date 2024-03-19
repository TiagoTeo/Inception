#!/bin/bash



openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/privatekey.key -out /etc/ssl/certs/certificate.crt -subj "/C=PT/L=Lisboa/O=42Lisboa/OU=Student/CN=mtiago-s.42.fr"


echo "
server {
    listen 443 ssl default_server;
    listen [::]:443 ssl default_server;

    server_name mtiago-s.42.fr www.mtiago-s.42.fr;

    ssl_certificate /etc/ssl/certs/certificate.crt;
    ssl_certificate_key /etc/ssl/private/privatekey.key;

    ssl_protocols TLSv1.3;
    }" > /etc/nginx/sites-available/default


# echo '

#     index index.php;
#     root /var/www/html;

#     location ~ [^/]\.php(/|$) { 
#             try_files $uri =404;
#             fastcgi_pass wordpress:9000;
#             include fastcgi_params;
#             fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
#         }
# }' >>  /etc/nginx/sites-available/default


nginx -g "daemon off;"
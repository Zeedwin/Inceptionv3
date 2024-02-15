#!/bin/sh
FILE_PATH="/etc/nginx/http.d/nginx.conf"

if ! [ -f "$FILE_PATH" ]; then
   cat << eof > $FILE_PATH
server {
    listen 443 ssl;
    server_name $DOMAIN_NAME;

    root /var/www/;
    index index.php index.html index.htm;
    ssl_certificate /etc/nginx/ssl/$DOMAIN_NAME/jgirard.crt;
    ssl_certificate_key /etc/nginx/ssl/$DOMAIN_NAME/jgirard.key;
    ssl_protocols TLSv1.2 TLSv1.3;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ .php$ {
        fastcgi_split_path_info ^(.+.php)(/.+)$;
        fastcgi_pass wordpress:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        fastcgi_param PATH_INFO \$fastcgi_path_info;
    }
}
eof
fi
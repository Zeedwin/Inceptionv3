FROM alpine:3.18
ARG phpver=81
ARG DB_NAME
ARG DB_PASS
ARG DB_USER
RUN apk update && apk add php${phpver} \
                 php${phpver}-bcmath \
                 php${phpver}-curl \
                 #php${phpver}-imagick \
                 php${phpver}-intl \
                 php${phpver}-json \
                 php${phpver}-mbstring \
                 php${phpver}-mysqli \
                 php${phpver}-xml \
                 php${phpver}-zip \
                 wget \
                 php${phpver}-fpm

RUN sed "-i" "s/127.0.0.1/0.0.0.0/g" "/etc/php81/php-fpm.d/www.conf"
WORKDIR /var/www/
RUN wget https://wordpress.org/latest.tar.gz && tar -xpf latest.tar.gz
RUN mv wordpress/* . && rm -rf latest.tar.gz wordpress
COPY ./requirements/wordpress/tools/wordpress_setup.sh .
RUN chmod +x wordpress_setup.sh && ./wordpress_setup.sh && rm wordpress_setup.sh
EXPOSE 9000
CMD [ "php-fpm81", "-F"]



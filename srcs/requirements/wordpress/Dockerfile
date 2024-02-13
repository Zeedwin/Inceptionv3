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
                 #php${phpver}-mysql \
                 php${phpver}-xml \
                 php${phpver}-zip \
                 wget
                 #php{phpver}-fpm

RUN wget https://wordpress.org/latest.tar.gz && tar -xpf latest.tar.gz 
RUN mv /wordpress/* /var/www/ && rm latest.tar.gz wordpress
COPY ./requirements/wordpress/tools/wordpress_setup.sh .
#RUN chmod +x wordpress_setup.sh && ./wordpress_setup.sh && rm wordpress_setup.sh
CMD [ "watch",  "-n", "1", "echo misbolas"]



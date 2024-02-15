FROM alpine:3.18
ARG DOMAIN_NAME
ARG SSL_KEY
ARG SSL_CERT
RUN apk update && apk add nginx && \
                  adduser -D -g 'www' www && \
                  chown -R www:www /var/lib/nginx && \
                  chown -R www:www /var/www
COPY ${SSL_KEY} /etc/nginx/ssl/${DOMAIN_NAME}/jgirard.key
COPY ${SSL_CERT} /etc/nginx/ssl/${DOMAIN_NAME}/jgirard.crt
COPY ./requirements/nginx/conf/nginx_conf.sh .
RUN chmod +x ./nginx_conf.sh && ./nginx_conf.sh && rm ./nginx_conf.sh
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;" ]
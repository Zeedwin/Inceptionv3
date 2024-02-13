FROM alpine:3.18
RUN apk update && apk add --no-cache mariadb mariadb-client 
ARG DB_NAME
ARG DB_PASS
ARG DB_USER
ARG DB_ROOT
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql/
RUN mkdir /run/mysqld && chown mysql:mysql /run/mysqld

RUN echo ${DB_NAME}
COPY ./requirements/mariadb/tools/create_db.sh .
RUN chmod +x create_db.sh && /create_db.sh && rm create_db.sh
USER mysql
CMD [ "mariadbd" ]
#CMD [ "watch",  "-n", "1", "echo misbolas"]
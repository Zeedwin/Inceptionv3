FROM alpine:3.18
RUN apk update && apk add --no-cache mariadb mariadb-client 
ARG DB_NAME
ARG DB_PASS
ARG DB_USER
ARG DB_ROOT
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql/
RUN mkdir /run/mysqld && chown mysql:mysql /run/mysqld

RUN mkdir /var/run/mysqld; \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } | tee  /etc/my.cnf.d/mariadb-server.cnf;
RUN sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf
RUN echo ${DB_NAME}
COPY ./requirements/mariadb/tools/create_db.sh .
COPY ./requirements/mariadb/tools/dump.sql .
RUN chmod +x create_db.sh && /create_db.sh && rm create_db.sh dump.sql
USER mysql
EXPOSE 3306
CMD [ "mariadbd" ]
#CMD [ "watch",  "-n", "1", "echo misbolas"]
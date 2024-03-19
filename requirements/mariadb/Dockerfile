FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

COPY ./tools/script.sh /
RUN chmod 744 script.sh

EXPOSE 3306

ENTRYPOINT [ "tail", "-f", "/dev/null" ]
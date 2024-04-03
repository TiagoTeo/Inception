FROM debian:bullseye

RUN apt update && \ 
    apt install mariadb-server -yq && \
    apt-get clean && \ 
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./tools/script.sh /tmp/script.sh

RUN chmod +x /tmp/script.sh


EXPOSE 3306

ENTRYPOINT /tmp/script.sh
# ENTRYPOINT [ "tail", "-f", "/dev/null" ]
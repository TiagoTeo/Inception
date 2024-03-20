FROM debian:bullseye

RUN apt update && \ 
    apt install mariadb-server -yq && \
    apt-get clean && \ 
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./tools/script.sh /tmp/script.sh

# RUN chmod +x script.sh

ENTRYPOINT /tmp/script.sh
# ENTRYPOINT [ "tail", "-f", "/dev/null" ]
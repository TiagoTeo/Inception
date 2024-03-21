FROM debian:bullseye

RUN apt update && \ 
    apt install nginx openssl -yq && \
    apt-get clean && \ 
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /etc/nginx/ssl

COPY ./tools/script.sh /

RUN chmod 777 script.sh

EXPOSE 443

CMD [ "/script.sh" ]


# ENTRYPOINT [ "tail", "-f", "/dev/null" ]
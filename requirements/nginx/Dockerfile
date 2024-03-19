FROM: debian:bullseye

RUN apt -y update && apt install -y nginx && apt install openssl -y

COPY ./tools/script.sh /

RUN chmod 777 script.sh

CMD [ "/script.sh" ]

ENTRYPOINT [ "tail", "-f", "/dev/null" ]
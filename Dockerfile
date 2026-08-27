FROM alpine:3.18

RUN apk add --no-cache bash curl gawk

COPY healthcheck.sh /usr/local/bin/healthcheck.sh

RUN chmod +x /usr/local/bin/healthcheck.sh

ENTRYPOINT [ "/usr/local/bin/healthcheck.sh" ]
CMD [ "http://localhost:8080" ]
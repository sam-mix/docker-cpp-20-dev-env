FROM alpine:latest

RUN sed -i 's#dl-cdn.alpinelinux.org#mirrors.cloud.tencent.com#g' /etc/apk/repositories && \
apk add --no-cache mysql-client

ENTRYPOINT ["mysql"]

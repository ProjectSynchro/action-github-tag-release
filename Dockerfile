FROM alpine

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing bash git hub

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh

FROM alpine:3.19.1

ADD . .

RUN apk add --no-cache aws-cli curl openssl git && \
    sh ./install_tools.sh
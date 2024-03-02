FROM alpine:3.19.1

ADD . .

RUN apk add --no-cache aws-cli curl bash openssl git && \
    bash ./install_tools.sh
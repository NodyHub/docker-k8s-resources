FROM alpine:3.11.2
RUN apk upgrade --update-cache --available && \
    apk add openssl socat && \
    rm -rf /var/cache/apk/*

ENV DOMAIN=localhost
ENV TARGET=127.0.0.1:80
ENV LISTEN=443
ENV SUBJ="/C=DE/L=HD/O=nodyd/CN=$DOMAIN"

CMD openssl genrsa -out srv.key 2048 && \
    openssl req -new -key srv.key -x509 -days 3653 -out srv.crt -subj $SUBJ && \
    cat srv.key srv.crt > srv.pem && \
    chmod 600 srv.key srv.pem && \
    socat openssl-listen:$LISTEN,reuseaddr,cert=/srv.pem,verify=0,fork TCP:$TARGET

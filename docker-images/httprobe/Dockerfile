FROM alpine

RUN apk update && apk add curl && rm -rf /var/cache/apk/*

ENV HTTP_PORTS "80 8080"
ENV HTTPS_PORTS "443 6443 8443"
ENV DATA_DIR /tmp
ENV TIMEOUT 1
ENV DOMAIN ""

COPY httprobe /bin/httprobe
RUN chmod 755 /bin/httprobe

ENTRYPOINT ["/bin/httprobe"]

FROM alpine

RUN apk update && apk add curl && rm -rf /var/cache/apk/*

ENV DATA_DIR /tmp

COPY crtsh /bin/crtsh
RUN chmod 755 /bin/crtsh 

ENTRYPOINT ["/bin/crtsh"]

FROM alpine:3.12.0

RUN apk add --no-cache nmap-ncat

ENV REPEAT_AFTER 0

WORKDIR /test
COPY allow.lst cfg/allow.lst
COPY deny.lst cfg/deny.lst
COPY test.sh .

CMD ["sh", "-c", "./test.sh"]

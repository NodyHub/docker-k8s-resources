FROM golang:1.13-alpine3.10 as build
RUN apk --no-cache add git
RUN go get github.com/OWASP/Amass; exit 0
ENV GO111MODULE on
WORKDIR /go/src/github.com/OWASP/Amass
RUN go install ./...

FROM alpine:latest
RUN apk --no-cache add ca-certificates jq
COPY --from=build /go/bin/amass /bin/amass
COPY --from=build /go/src/github.com/OWASP/Amass/examples/wordlists/ /wordlists/
WORKDIR /run
RUN chmod 777 /run
ENV HOME /run
ENV DATA_DIR /tmp
COPY run.sh .
RUN chmod 755 run.sh
ENTRYPOINT ["/run/run.sh"]

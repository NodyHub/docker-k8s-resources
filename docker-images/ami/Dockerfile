# Build Image for amicontained
FROM golang:alpine AS build-env

RUN apk --no-cache add build-base git bzr mercurial gcc
WORKDIR /src
RUN git clone https://github.com/genuinetools/amicontained.git
WORKDIR /src/amicontained
RUN go build -o amicontained -ldflags "-linkmode external -extldflags -static"

# Image: docker.io//nodyd/ami
FROM alpine:3.11

WORKDIR /tools
COPY --from=build-env /src/amicontained/amicontained .

CMD sleep infinity

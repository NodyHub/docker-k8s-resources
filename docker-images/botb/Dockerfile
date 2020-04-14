# Build Image for BOtB
FROM golang:alpine AS build-env

RUN apk --no-cache add build-base git bzr mercurial gcc
WORKDIR /src
RUN git clone https://github.com/brompwnie/botb.git
RUN cd /src/botb && go build -o botb -ldflags "-linkmode external -extldflags -static"

# Image: nodyd/botb
FROM ubuntu:18.04

WORKDIR /tools
COPY --from=build-env /src/botb/botb .

CMD sleep infinity

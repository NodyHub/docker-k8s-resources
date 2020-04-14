# Docker-Hub Image nodyd/ssl-fwd

- [Docker image](https://hub.docker.com/r/nodyd/ssl-fwd) that exposes an TLS socat forwarder
- Builds up on [alpine:3.11.2](https://hub.docker.com/_/alpine)
- Starts as`USER root`
- Environment variales with defaults:
```
ENV DOMAIN=localhost
ENV TARGET=127.0.0.1:80
ENV LISTEN=443
```
- Generates self-signed certificate for `"/C=DE/L=HD/O=nodyd/CN=$DOMAIN"`

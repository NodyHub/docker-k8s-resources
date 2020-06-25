# Test TCP

This docker image is intended to be used to check for network connections. It is a quick-and-dirty PoC to verify if network communications are available that should not be available and vice-versa. If the condition is not matched anymore, the container crashes. 

The image is published on Docker Hub and can be started with `docker run --rm -it nodyd/test-tcp`

## Configuration

The image containes the file `/test/allow.lst` and `/test/deny.lst`. These files containes hostnames/ip's and ports that should be checked.

If the environment variable `REPEAT_AFTER` is not specified, the container stops after connection checks successfully. If the value is set, the container will run infinitly and re-check the connection every `REPEAT_AFTER` seconds. In case of a connection comes available, the container crashes.

## TODO

[ ] Kubernetes Deployment file
[ ] Helm Chart

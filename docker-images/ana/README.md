# Docker-Hub Image nodyd/ana

- [Docker image](https://hub.docker.com/r/nodyd/ana) that contains basic Docker, Kubernetes and network analysis tools for assessments.
- Builds up on [debian:buster](https://hub.docker.com/_/debian)
- Copied and extended from [uchi-mata@github](https://github.com/uchi-mata/system-analysis).
- Starts as `USER $USER`
- Generated key pairs for server and client under `/tools/keys` base64 encoded

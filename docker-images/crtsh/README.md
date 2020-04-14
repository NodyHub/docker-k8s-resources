# crt.sh
- Docker image that crawls the content from crt.sh
- Specifies `ENV DATA_DIR /tmp` to store results in this directory 
- Example execurion: `docker run --rm -it -v $DATA_DIR:$DATA_DIR -e DATA_DIR nodyd/crtsh foobar.com`
- Example shell function is located in `fkt`
- Configuration parameter are located in `cfg`

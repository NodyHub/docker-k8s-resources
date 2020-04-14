# httprobe
- Sends http probes to common web ports to find webserver
- Example run: `docker run --rm -it -v$DATA_DIR:$DATA_DIR -e DATA_DIR -e DOMAIN nodyd/httprobe $DATA_DIR/domain.lst`
- Example shell function is located in `fkt`
- Configuration parameter are located in `cfg`

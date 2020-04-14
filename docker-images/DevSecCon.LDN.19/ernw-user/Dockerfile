FROM docker.io/ernw/base:dsc.ldn.19

# Prepare keys and cfg -- in case it's tested ;)
COPY sshkey.pub /home/ernw/.srv/authorized_keys
COPY sshd_config /home/ernw/run_cfg
RUN chmod 655 /home/ernw/run_cfg && \
    chown -R ernw:ernw /home/ernw

# Switch to user
USER ernw
WORKDIR /home/ernw
RUN /usr/bin/ssh-keygen -b 2048 -t rsa -P "" -q -f /home/ernw/.srv/magic_secret && \
    cat /home/ernw/.srv/magic_secret.pub >> /home/ernw/.srv/authorized_keys 

CMD sleep infinity

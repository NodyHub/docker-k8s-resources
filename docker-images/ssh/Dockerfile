FROM ubuntu:18.04

ENV USERNAME user
ENV PASSWORD password
ENV KEY_TYPE rsa

# Set ENV für apt
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical

# Install assessment toolset
RUN apt-get -qy update                  &&  \
    apt-get -qy install                     \
        curl                                \
        openssh-server                      \
        sudo

# Create user `$USERNAME`
RUN useradd -ms /bin/bash -p "$(openssl passwd -1 $PASSWORD)" $USERNAME
RUN echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/0-$USERNAME
RUN echo "%root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/1-root-group

# Prepare keys and cfg
WORKDIR /home/$USERNAME/.srv
COPY sshd_config cfg
COPY sshkey.pub auth
RUN chown -R $USERNAME:$USERNAME /home/$USERNAME

# Change to run-user
USER $USERNAME
WORKDIR /home/$USERNAME

# Start SSH daemon and sleep
CMD /usr/bin/ssh-keygen -t $KEY_TYPE -P '' -q -f ~/.srv/key            && \
    chmod 400 ~/.srv/key                                     && \
    chmod 400 ~/.srv/key.pub                                 && \
    /usr/sbin/sshd -f .srv/cfg -D

EXPOSE 6667

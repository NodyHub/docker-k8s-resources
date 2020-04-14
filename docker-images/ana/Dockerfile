FROM debian:buster

ENV USERNAME user

# Set ENV für apt
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical

# Install assessment toolset
RUN apt-get -qy update                  &&  \
    apt-get -qy install                     \
        curl                                \
        docker.io                           \
        dnsutils                            \
        dsniff                              \
        gdb                                 \
        gcc                                 \
        git                                 \
        golang-go                           \
        hping3                              \
        htop                                \
        iproute2                            \
        iptables                            \
        iputils-ping                        \
        mongo-tools                         \
        mtr                                 \
        net-tools                           \
        nmap                                \
        netcat                              \
        openssh-server                      \
        python3                             \
        python3-pip                         \
        screen                              \
        socat                               \
        stunnel                             \
        strace                              \
        sudo                                \
        tcpdump                             \
        traceroute                          \
        tmux                                \
        libcap-ng-utils                     \
        unzip                               \
        vim                                 \
        whois                               \
        wget                                \
        zip                             &&  \
        rm -f /etc/ssh/ssh_host*        &&  \
        mkdir -p /root/.ssh             &&  \
        chmod 0700 /root/.ssh           &&  \
        apt-get -qy clean               &&  \
        apt-get -qy autoclean           &&  \
        apt-get -qy autoremove --purge  &&  \
        pip3 install scapy

# Copy kubernetes tools
COPY kubectl-linux-amd64-1.13.5 /usr/local/bin/kubectl
COPY pks-linux-amd64-1.3.0-build.230 /usr/local/bin/pks
COPY requirements.txt /tools/requirements.txt
COPY api.py /tools/api.py
RUN chmod 777 /usr/local/bin/kubectl          &&  \
    chmod 777 /usr/local/bin/pks              &&  \
    pip3 install -r /tools/requirements.txt   &&  \
    rm /tools/requirements.txt                &&  \
    chmod 755 /tools/api.py

# Prepare tools
WORKDIR /tools

# Nmap renaming test
RUN cp /usr/bin/nmap pamn

# Nmap hashsum editing
RUN echo "A" >> add                           && \
    cat /usr/bin/nmap add > pamn-extended     && \
    chmod +x pamn-extended                    && \
    rm add

# Prepare SSH server
COPY gen_b64_ssh-key.sh gen_b64_ssh-key.sh
RUN chmod +x gen_b64_ssh-key.sh               && \
    cp /usr/sbin/sshd remoted

# Generate Keys
WORKDIR /tools/keys
RUN /tools/gen_b64_ssh-key.sh client rsa      && \
    /tools/gen_b64_ssh-key.sh server rsa

# Create user `$USERNAME`
RUN useradd -ms /bin/bash -p "$(openssl passwd -1 password)" $USERNAME
RUN echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/0-$USERNAME
RUN echo "%root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/1-root-group

# Switch to user
USER $USERNAME
WORKDIR /home/$USERNAME

# keep running
CMD sleep infinity

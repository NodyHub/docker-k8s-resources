FROM debian:10.1

# Set ENV für apt
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical

# Install assessment toolset
RUN apt-get -qy update                  &&  \
    apt-get -qy full-upgrade            &&  \
    apt-get -qy install                     \
        curl                                \
        dnsutils                            \
        dsniff                              \
        gdb                                 \
        git                                 \
        gcc                                 \
        hping3                              \
        htop                                \
        iproute2                            \
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
        vim                                 \
        whois                               \
        wget                            &&  \
        rm -f /etc/ssh/ssh_host*        &&  \
        mkdir -p /root/.ssh             &&  \
        chmod 0700 /root/.ssh           &&  \
        apt-get -qy clean               &&  \
        apt-get -qy autoclean           &&  \
        apt-get -qy autoremove --purge  &&  \
        pip3 install scapy

# Create user `ernw`
RUN useradd -ms /bin/bash -p "$(openssl passwd -1 password)" ernw
RUN echo 'ernw ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/0-ernw
RUN echo '%root ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/1-root-group

# Copy kubernetes tools
COPY kubectl-linux-amd64-1.13.5 /usr/local/bin/kubectl
RUN chmod 777 /usr/local/bin/kubectl
COPY pks-linux-amd64-1.3.0-build.230 /usr/local/bin/pks
RUN chmod 777 /usr/local/bin/pks
COPY requirements.txt /tools/requirements.txt
RUN pip3 install -r /tools/requirements.txt && \
    rm /tools/requirements.txt && \
    chmod 755 /tools/api.py

# Prepare SSH server
WORKDIR /tools/
RUN cp /usr/sbin/sshd /tools/ernwd 
COPY create_ssh_keys.sh create_ssh_keys.sh
RUN chmod +x create_ssh_keys.sh && \
    ./create_ssh_keys.sh && \
    rm create_ssh_keys.sh

# Nmap renaming test
RUN cp /usr/bin/nmap /tools/scanner-renamed

# Nmap hashsum editing
RUN echo "A" >> /tools/add 
RUN cat /usr/bin/nmap /tools/add > /tools/scanner-extended && \
    chmod +x scanner-extended && \
    rm /tools/add

# keep running
CMD sleep infinity

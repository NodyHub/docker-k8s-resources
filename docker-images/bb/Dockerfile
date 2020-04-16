FROM ubuntu:18.04

ENV USERNAME hunter
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt update && \
    apt install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common \
      zsh \
      vim \
      htop \
      nload \
      sudo \
      git \
      wget \
      golang && \
    add-apt-repository ppa:longsleep/golang-backports && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
      golang-go 

# Create user `$USERNAME`
RUN useradd -ms /usr/bin/zsh -p "$(openssl passwd -1 password)" $USERNAME
RUN echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/0-$USERNAME
RUN echo "%root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/1-root-group

# Switch to user
RUN mkdir -p /home/$USERNAME/git 
WORKDIR /home/$USERNAME/git
COPY install-tools.sh install-tools.sh
RUN chmod 755 install-tools.sh

RUN chown -R $USERNAME:$USERNAME /home/$USERNAME/
USER $USERNAME
WORKDIR /home/$USERNAME/git
RUN ./install-tools.sh
WORKDIR /home/$USERNAME

# keep running
CMD zsh


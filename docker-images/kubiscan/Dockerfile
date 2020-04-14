FROM ubuntu:18.04

RUN apt-get update \
	&& apt-get install -y python3 python3-pip git \
	&& pip3 install kubernetes PTable \
	&& rm -rf /var/cache/* \
	&& rm -rf /var/lib/apt/lists/*

RUN echo "alias kubiscan='python3 /KubiScan/KubiScan.py'" > /root/.bash_aliases
RUN . /root/.bash_aliases

RUN git clone https://github.com/cyberark/KubiScan.git /KubiScan 

CMD sleep infinity

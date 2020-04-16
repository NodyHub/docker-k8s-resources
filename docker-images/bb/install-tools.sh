#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade

export DEBIAN_FRONTEND noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

sudo apt-get update
sudo -E apt install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      golang \
      htop \
      nload \
      software-properties-common \
      sudo \
      git \
      wget \
      vim \
      zsh 

sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update && \
sudo -E apt-get -y install \
      build-essential \
      golang-go \
      jq \
      libcurl4-openssl-dev \
      libssl-dev \
      libffi-dev 
      libldns-dev \
      python-dev \
      python-setuptools \
      python3-pip \
      python-pip \
      python-dnspython \
      rename \
      ruby-full \
      git

echo "AWS cli"
sudo -E apt install -y awscli
echo "Don't forget to set up AWS credentials!"

cd ~/git

#install aquatone
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
sed -i 's/"--disable-notifications",/"--disable-notifications", "--no-sandbox",/g' ~/go/src/github.com/michenriksen/aquatone/agents/url_screenshotter.go
go get github.com/michenriksen/aquatone

#install chromium
echo "Installing Chromium"
sudo -E apt-get install -y chromium-browser

# TODO
echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/git/

echo "install altdns"
pip install py-altdns

# TODO
echo "Install EyeWitness"
git clone https://github.com/FortyNorthSecurity/EyeWitness.git
cd EyeWitness/Python/setup/
sudo ./setup.sh
mkdir -p /tmp/EyeWitness
cd ~/git/

echo "Install LinkFinder"
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
pip3 install -r requirements.txt
python setup.py install
cd ~/git/

echo "Install jsearch"
git clone https://github.com/incogbyte/jsearch.git
cd jsearch
pip3 install -r requirements.txt
cd ~/git/

echo "install masscan"
git clone https://github.com/robertdavidgraham/masscan
cd masscan
make
sudo cp bin/masscan /usr/local/bin/
cd ~/git/

echo "Install subjack"
go get github.com/haccer/subjack

echo "install gitrob"
go get github.com/michenriksen/gitrob

echo "install droopscan"
pip install droopescan

echo "iinstall joomscan"
git clone https://github.com/rezasp/joomscan.git

echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/git/

echo "installing teh_s3_bucketeers"
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd ~/git/

echo "install gobuster"
sudo go get github.com/OJ/gobuster

echo "installing wpscan"
sudo gem install wpscan

echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git

echo "installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/git/

echo "installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/git/

echo "installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/git/

echo "installing nmap"
sudo -E apt-get install -y nmap

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd massdns
make
cd ~/git/

echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd asnlookup
pip install -r requirements.txt
cd ~/git/

echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 

echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls

echo "installing crtndstry"
git clone https://github.com/nahamsec/crtndstry.git


echo "get dot-files"
git clone https://github.com/NodyHub/dot-files.git
cd dot-files
./deploy.sh
cd ~/git/

# 

exit 0

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
      whois \
      vim \
      zsh 

sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update
sudo -E apt-get -y install \
      build-essential \
      golang-go \
      jq \
      libcurl4-openssl-dev \
      libssl-dev \
      libffi-dev \
      libldns-dev \
      python-dev \
      python-setuptools \
      python3-pip \
      python-pip \
      python-dnspython \
      rename \
      ruby-full \
      git


cd ~/git

###########################################################################
# Install aquatone
###########################################################################
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
sed -i 's/"--disable-notifications",/"--disable-notifications", "--no-sandbox",/g' ~/go/src/github.com/michenriksen/aquatone/agents/url_screenshotter.go
go get github.com/michenriksen/aquatone

###########################################################################
# Install altdns
###########################################################################
echo "Install altdns"
pip install py-altdns

###########################################################################
# Install asnlookup
###########################################################################
echo "Installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd asnlookup
pip install -r requirements.txt
cd ~/git/

###########################################################################
# Install AWS cli
###########################################################################
echo "Install AWS cli"
sudo -E apt install -y awscli

###########################################################################
# Install Amass
###########################################################################
echo "Installing Amass"
mkdir amass
cd amass
wget https://github.com/OWASP/Amass/releases/download/v3.5.5/amass_v3.5.5_linux_amd64.zip
unzip amass_v3.5.5_linux_amd64.zip
sudo cp amass_*/amass /bin/amass
cd ~/git

###########################################################################
# Install chromium
###########################################################################
echo "Installing Chromium"
sudo -E apt-get install -y chromium-browser

###########################################################################
# Install crtindustry
###########################################################################
echo "Installing crtndstry"
git clone https://github.com/nahamsec/crtndstry.git

###########################################################################
# Install dirsearch
###########################################################################
echo "Installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git

###########################################################################
# Install droopscan
###########################################################################
echo "Install droopscan"
pip install droopescan

###########################################################################
# Install gitrob
###########################################################################
echo "Install gitrob"
go get github.com/michenriksen/gitrob

###########################################################################
# Install JSParser
# TODO: broken
###########################################################################
echo "Installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser
python setup.py install
cd ~/git/

###########################################################################
# Install EyeWitness
# TODO: broken
###########################################################################
echo "Install EyeWitness"
git clone https://github.com/FortyNorthSecurity/EyeWitness.git
cd EyeWitness/Python/setup/
sudo ./setup.sh
mkdir -p /tmp/EyeWitness
cd ~/git/

###########################################################################
# Install gobuster
###########################################################################
echo "Install gobuster"
sudo go get github.com/OJ/gobuster

###########################################################################
# Install httprobe
###########################################################################
echo "Installing httprobe"
go get -u github.com/tomnomnom/httprobe 

###########################################################################
# Install joomscan
###########################################################################
echo "Install joomscan"
git clone https://github.com/rezasp/joomscan.git

###########################################################################
# install jsearch
###########################################################################
echo "Install jsearch"
git clone https://github.com/incogbyte/jsearch.git
cd jsearch
pip3 install -r requirements.txt
cd ~/git/

###########################################################################
# Install knock
###########################################################################
echo "Installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd knock
python setup.py install                                                                                                                                                                                                                       
cd ~/git/

###########################################################################
# Install LinkFinder
###########################################################################
echo "Install LinkFinder"
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
pip3 install -r requirements.txt
python setup.py install
cd ~/git/

###########################################################################
# Install massdns
###########################################################################
echo "Installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd massdns
make
cd ~/git/

###########################################################################
# Install masscan
###########################################################################
echo "Install masscan"
git clone https://github.com/robertdavidgraham/masscan
cd masscan
make
sudo cp bin/masscan /usr/local/bin/
cd ~/git/

###########################################################################
# Install nmap
###########################################################################
echo "Installing nmap"
sudo -E apt-get install -y nmap

###########################################################################
# Install sqlmap
###########################################################################
echo "Installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/git/

###########################################################################
# Install subjack
###########################################################################
echo "Install subjack"
go get github.com/haccer/subjack

###########################################################################
# Install Sublist3r
###########################################################################
echo "Installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
python setup.py install --user
cd ~/git/

###########################################################################
# Install teh_s3_bucketeers
###########################################################################
echo "Installing teh_s3_bucketeers"
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd ~/git/

###########################################################################
# Install unfurl
###########################################################################
echo "Installing unfurl"
go get -u github.com/tomnomnom/unfurl 

###########################################################################
# Install virtual-host-discovery
###########################################################################
echo "Installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/git/

###########################################################################
# Install wpscan
###########################################################################
echo "Installing wpscan"
sudo apt install curl git libcurl4-openssl-dev make zlib1g-dev gawk g++ gcc libreadline6-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config ruby ruby-bundler ruby-dev -y
sudo gem install wpscan

###########################################################################
# Install waybackurls
###########################################################################
echo "Installing waybackurls"
go get github.com/tomnomnom/waybackurls

###########################################################################
# Setup dot-files
###########################################################################
echo "Get dot-files"
git clone https://github.com/NodyHub/dot-files.git
cd dot-files
./deploy.sh
cd ~/git/

###########################################################################
# Clean up
###########################################################################
echo "Clean up"
sudo apt autoremove -y


exit 0

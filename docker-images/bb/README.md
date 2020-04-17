# BugBounty Image

The image can be pulled from Docker Hub and started as following:
```
docker run -v $HOME/data:/data -v $HOME/wordlists:/wordlists --rm -it docker.io/nodyd/bb
``` 

*Disclaimer:* The image is massive big :D

## installed tools

Container image that contains following tools:

- [Aquatone](https://github.com/michenriksen/aquatone) ```cat domain.txt | aquatone -out /data/aquatone```
- [altdns](https://github.com/infosec-au/altdns) ```altdns -i altdns.in -w /wordlists/altdns.txt -o altdns.out```
- [Amass](https://github.com/OWASP/Amass) ```amass ???```
- [asnlookup](https://github.com/yassineaboukir/Asnlookup) <- License key needed
- [awscli](https://github.com/aws/aws-cli)
- [Chromium](https://www.chromium.org/)
- [crtndstry](https://github.com/nahamsec/crtndstry) <- Broken
- [dirsearch](https://github.com/maurosoria/dirsearch)
- [droopscan](https://github.com/droope/droopescan)
- [gitrob](https://github.com/michenriksen/gitrob) <- [Access Token needed](https://github.com/michenriksen/gitrob#github-access-token)
- [gobuster](https://github.com/OJ/gobuster)
- [httprobe](https://github.com/tomnomnom/httprobe)
- [joomscan](https://github.com/rezasp/joomscan)
- [jsearch](https://github.com/incogbyte/jsearch)
- [knock](https://github.com/guelfoweb/knock) ```knockpy -c knockpy.out <trgt.tld>```
- [LinkFinder](https://github.com/GerbenJavado/LinkFinder)
- [masscan](https://github.com/robertdavidgraham/masscan)
- [massdns](https://github.com/blechschmidt/massdns)
- [Nmap](https://nmap.org/)
- [subjack](https://github.com/haccer/subjack)
- [Sublist3r](https://github.com/aboul3la/Sublist3r)
- [sqlmap](https://github.com/sqlmapproject/sqlmap)
- [teh_s3_bucketeers](https://github.com/tomdev/teh_s3_bucketeers)
- [unfurl](https://github.com/tomnomnom/unfurl)
- [virtual-host-discovery](https://github.com/jobertabma/virtual-host-discovery)
- [wpscan](https://github.com/wpscanteam/wpscan)
- [waybackurl](https://github.com/tomnomnom/waybackurls)


## Todo

Install:

-
- crtsh
- https://github.com/devanshbatham/ParamSpider

Further stuff:

- Create proper zshrc with alias


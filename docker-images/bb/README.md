# BugBounty Image

The image can be pulled from Docker Hub and started as following:
```
docker run -v $HOME/data:/data -v $HOME/wordlists:/wordlists --rm -it docker.io/nodyd/bb
``` 

*Disclaimer:* The image is massive big :D

## Manual Stuff

- https://github.com/Plazmaz/leaky-repo
- https://github.com/swisskyrepo/PayloadsAllTheThings
- https://medium.com/@vignesh4303/collection-of-bug-bounty-tip-will-be-updated-daily-605911cfa248

## Additional wordlist

### Files
```
/heapdump
```

## installed tools

Container image that contains following tools:

- [Aquatone](https://github.com/michenriksen/aquatone) ```cat domain.txt | aquatone -out /data/aquatone```
- [altdns](https://github.com/infosec-au/altdns) ```altdns -i altdns.in -w /wordlists/altdns.txt -o altdns.out```
- [Amass](https://github.com/OWASP/Amass) passive: ```amassp <trgt.tld>```
- [asnlookup](https://github.com/yassineaboukir/Asnlookup) <- License key needed
- [awscli](https://github.com/aws/aws-cli)
- [Chromium](https://www.chromium.org/)
- [crtndstry](https://github.com/nahamsec/crtndstry) <- Broken
- [dirsearch](https://github.com/maurosoria/dirsearch) ```dirsearch -u <url> -e <file-ext, e.g., php, asp, aspx, jsp, js, html, do, action>```
- [droopscan](https://github.com/droope/droopescan)
- [gitrob](https://github.com/michenriksen/gitrob) <- [Access Token needed](https://github.com/michenriksen/gitrob#github-access-token)
- [gobuster](https://github.com/OJ/gobuster)
- [httprobe](https://github.com/tomnomnom/httprobe) ```cat domains.txt | httprobe | tee httprobe.out```
- [joomscan](https://github.com/rezasp/joomscan)
- [jsearch](https://github.com/incogbyte/jsearch)
- [knockpy](https://github.com/guelfoweb/knock) ```knockpy -c <trgt.tld>```
- [LinkFinder](https://github.com/GerbenJavado/LinkFinder)
- [masscan](https://github.com/robertdavidgraham/masscan)
- [massdns](https://github.com/blechschmidt/massdns)
- [Nmap](https://nmap.org/)
- [subjack](https://github.com/haccer/subjack)
- [Sublist3r](https://github.com/aboul3la/Sublist3r) ```sublist3r -d <domain.tld> -o sublist3r.out```
- [sqlmap](https://github.com/sqlmapproject/sqlmap)
- [teh_s3_bucketeers](https://github.com/tomdev/teh_s3_bucketeers)
- [unfurl](https://github.com/tomnomnom/unfurl) ```cat urls.txt | unfurl domains | tee domains.txt```
- [virtual-host-discovery](https://github.com/jobertabma/virtual-host-discovery)
- [wpscan](https://github.com/wpscanteam/wpscan)
- [waybackurl](https://github.com/tomnomnom/waybackurls) ```waybackurls domain.tld | tee waybackurls.out```


## Todo

Install:
- https://github.com/devanshbatham/ParamSpider
- https://github.com/stevenvachon/broken-link-checker

Further stuff:

- Create proper zshrc with alias

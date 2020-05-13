# BugBounty Image

The image can be pulled from Docker Hub and started as following:
```
docker run -v $HOME/data:/data -v $HOME/wordlists:/wordlists --rm -it docker.io/nodyd/bb
``` 

*Disclaimer:* The image is massive big :D

A recommended approach is to use the following shell function to start the container, e.g., `bbd $project`. The function creates automatically the directory `$HOME/bugbounty/targets/$project/<current_date>`. Whereas the directory `<current_date>` is the date when you start the container in format `YYYY-MM-DD`. 
```bash
# --------------------------------------------------------------------------------------------------------------------------
# Start BB Docker Container
# --------------------------------------------------------------------------------------------------------------------------
function bbd() {
  if [ $1 ] && project_name=$1 || project_name="undefined"
  dictionaries=$HOME/bugbounty/resources/dictionaries
  projects=$HOME/bugbounty/targets
  hist_file=$projects/$project_name/zsh-history
  todays_project=$projects/$project_name/$(date +%Y-%m-%d)
  if [ ! -f $hist_file ] && touch $hist_file
  if [ ! -d $wordlists ] && mkdir -p $wordlists
  if [ ! -d $todays_project ] && mkdir -p $todays_project
  docker run -it --rm \
    --mount "type=bind,src=$hist_file,dst=/home/hunter/.history" \
    --mount "type=bind,src=$projects,dst=/all" \
    --mount "type=bind,src=$todays_project,dst=/data" \
    --mount "type=bind,src=$dictionaries,dst=/dict" \
    --workdir /data \
    --user "$(id -u):$(id -g)" \
    docker.io/nodyd/bb:latest
}

```

The smart feature of using this shell function is that following directories are at every start the same
- `/data` is always pointing to the directoty `$project/<current_date>`
- `/all` contains all projects that have been created, including all sub-directories
- `/dict` is ment to share all wordlists that are used during target enumeration. You can manipulate this directory from every container and the content is shared between all container. Works like a charm, let me tell you ;)


## Manual Stuff

Firefox Extensions:

- https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/

Other stuff

- https://medium.com/@vignesh4303/collection-of-bug-bounty-tip-will-be-updated-daily-605911cfa248
- [Relaxed JSON Beautifier](https://beautifier.io/)
- SAML
  - [SAML Encoder](https://www.samltool.com/base64.php)
  - [How to Hunt Bugs in SAML part 1](https://epi052.gitlab.io/notes-to-self/blog/2019-03-07-how-to-test-saml-a-methodology/)
  - [How to Hunt Bugs in SAML part 1](https://epi052.gitlab.io/notes-to-self/blog/2019-03-13-how-to-test-saml-a-methodology-part-two/)
  - [How to Hunt Bugs in SAML part 3](https://epi052.gitlab.io/notes-to-self/blog/2019-03-16-how-to-test-saml-a-methodology-part-three/)
- [List of bug bounty writeups (2012-2020)](https://pentester.land/list-of-bug-bounty-writeups.html)
- [Grep github](https://grep.app/)
- [Param Miner](https://portswigger.net/bappstore/17d2949a985c4b7ca092728dba871943)
- [can-i-take-over-xyz](https://github.com/EdOverflow/can-i-take-over-xyz)

## Wordlist

- https://github.com/danielmiessler/SecLists
- https://github.com/Plazmaz/leaky-repo
- https://github.com/swisskyrepo/PayloadsAllTheThings
- https://github.com/AvasDream/pentesting-dockerfiles#payloads

### Files
```
heapdump
__clockwork
```

## Installed tools

Container image that contains following tools:

- [Aquatone](https://github.com/michenriksen/aquatone) `cat domain.txt | aquatone -out /data/aquatone`
- [altdns](https://github.com/infosec-au/altdns) `altdns -i altdns.in -w /wordlists/altdns.txt -o altdns.out`
- [Amass](https://github.com/OWASP/Amass) passive: `amassp <trgt.tld>`
- [asnlookup](https://github.com/yassineaboukir/Asnlookup) <- License key needed
- [awscli](https://github.com/aws/aws-cli)
- [Chromium](https://www.chromium.org/)
- [crtndstry](https://github.com/nahamsec/crtndstry) <- Broken
- [crtsh](bin/crtsh) `crtsh <target.tld>`
- [dirsearch](https://github.com/maurosoria/dirsearch) `dirsearch -u <url> -e <file-ext, e.g., php, asp, aspx, jsp, js, html, do, action>`
- [domcol](bin/domcol) Combines sublist3r, crtsh, waybackurl and Amass (passive) to one output `domcol <target.tld>`
- [droopscan](https://github.com/droope/droopescan)
- [gitdumper.sh](https://github.com/internetwache/GitTools/tree/master/Dumper) `gitdumper.sh https://target.tld/.git/ output_dir`
- [gitrob](https://github.com/michenriksen/gitrob) <- [Access Token needed](https://github.com/michenriksen/gitrob#github-access-token)
- [gobuster](https://github.com/OJ/gobuster) - dirscan for some jucy files with alias `gojucy <url>`
- [httprobe](https://github.com/tomnomnom/httprobe) `cat domains.txt | httprobe | tee httprobe.out`
- [joomscan](https://github.com/rezasp/joomscan)
- [jsearch](https://github.com/incogbyte/jsearch)
- [knockpy](https://github.com/guelfoweb/knock) `knockpy -c <trgt.tld>`
- [LinkFinder](https://github.com/GerbenJavado/LinkFinder) `linkfinder <js-url>`
- [masscan](https://github.com/robertdavidgraham/masscan)
- [massdns](https://github.com/blechschmidt/massdns)
- [Nmap](https://nmap.org/)
- [noc](bin/noc) Script to remove coloring from cli output `echo "arbitrary tool that produces colored output" | noc`
- [subjack](https://github.com/haccer/subjack)
- [Sublist3r](https://github.com/aboul3la/Sublist3r) `sublist3r -d <domain.tld> -o sublist3r.out`
- [sqlmap](https://github.com/sqlmapproject/sqlmap)
- [teh_s3_bucketeers](https://github.com/tomdev/teh_s3_bucketeers)
- [unfurl](https://github.com/tomnomnom/unfurl) `cat urls.txt | unfurl domains | tee domains.txt`
- [virtual-host-discovery](https://github.com/jobertabma/virtual-host-discovery)
- [wpscan](https://github.com/wpscanteam/wpscan)
- [waybackurl](https://github.com/tomnomnom/waybackurls) `waybackurls domain.tld | tee waybackurls.out`


## Todo

Install:
- https://github.com/0ang3el/aem-hacker
- https://github.com/s0md3v/Arjun
- https://github.com/stevenvachon/broken-link-checker
- https://github.com/bridgecrewio/checkov
- https://github.com/internetwache/GitTools/tree/master/Dumper
- https://github.com/tarunkant/Gopherus
- https://github.com/RhinoSecurityLabs/GCPBucketBrute
- https://github.com/devanshbatham/ParamSpider
- https://github.com/ghostlulzhacks/s3brute
- https://github.com/epinna/tplmap
- https://github.com/appsecco/spaces-finder	
- https://github.com/vincd/wappylyzer


Further stuff:

- Prepare further shell functions.

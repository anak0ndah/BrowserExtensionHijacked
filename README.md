# Chrome Extension Supply Chain Attack
## Overview
This repository provides a comprehensive collection of detection rules and threat intelligence focused on malicious Chrome extensions supply chain attack incident that occurs between 24-26 December.

### Refs : 
- https://www.vulnu.com/p/breaking-cyberhaven-chrome-extension-compromised
- https://secureannex.com/blog/cyberhaven-extension-compromise/
- The developers of Cyberheaven's Chrome extension, one of the heavily affected companies, have released an incident report : https://www.cyberhaven.com/engineering-blog/cyberhavens-preliminary-analysis-of-the-recent-malicious-chrome-extension
- https://www.extensiontotal.com/cyberhaven-incident-live

## Purpose of the repo 
- Provide detection rules (YARA and Sigma)
- Share Indicators of Compromise (IoCs)
- Document threat actor techniques
- Enable proactive threat hunting
- Support incident response activities

## TTPs 
![image](https://github.com/user-attachments/assets/8454952a-a50e-4daf-9aa7-ec7b5d98901a)

## Indicators of Compromise (IoCs) - Chrome Extension Stealer Campaign December  2024
### Domains
- cyberhavenext[.]pro
- gptforbusiness[.]site
- ext[.]businessforai[.]com
- barefootcontractor[.]com
- uvoice[.]live
- cyberhavenext[.]pro
- primusext[.]pro
- ultrablock[.]pro
- dearflip[.]pro
- parrottalks[.]info
- vidnozflex[.]live
- wakelet[.]ink
- locallyext[.]ink
- tinamind[.]info
- apple-ads-metric[.]com
- aeromexi[.]co
- gptforads[.]info
- blockforads[.]com
- ytbadblocker[.]com
- searchcopilot[.]co
- geminiaigg[.]pro
- blockadsonyt[.]vip
- fadblock[.]pro
- lltvmarkets[.]com
- savgptforchrome[.]pro
- bardaiforchrome[.]live
- com-freeapps[.]com
- gpt4summary[.]ink
- searchaiassitant[.]info
- artseasy[.]com
- savechatgpt[.]site
- upwordwave[.]com
- yescaptcha[.]pro
- videodownloadhelper[.]pro
- castorus[.]info
- bookmarkfc[.]info
- proxyswitchyomega[.]pro
- graphqlnetwork[.]pro
- iobit[.]pro
- internetdownloadmanager[.]pro
- searchgptchat[.]info
- pieadblock[.]pro
- gptdetector[.]live
- chatgptextent[.]pro
- youtubeadsblocker[.]live
- chatgptextension[.]site
- remiwantnun[.]com
- okta-onsolve[.]com
- capitalizerutc[.]com
- extensionpolicyprivacy[.]com
- policyextension[.]info
- extensionpolicy[.]net
- checkpolicy[.]site
- linewizeconnect[.]com
- extensionbuysell[.]com
- adskiper[.]net
- aiforgemini[.]com
- sclpfybn[.]com
- tnagofsg[.]com
- kra18[.]com

### IP Addresses

- 149[.]28[.]124[.]84
- 45[.]76[.]225[.]148
- 136[.]244[.]115[.]219
- 149[.]248[.]44[.]88
- 108[.]61[.]23[.]192
- 80[.]240[.]21[.]36
- 45[.]32[.]69[.]11
- 155[.]138[.]253[.]165
- 45[.]77[.]5[.]196
- 144[.]202[.]123[.]86
- 74[.]220[.]199[.]9
- 45[.]32[.]231[.]212
- 149[.]28[.]117[.]236
- 137[.]220[.]48[.]214
- 149[.]248[.]2[.]160

### File Hashes (SHA256)

- 91ff6f07b3f2347da00b5ec9907d0b7753cca9c442cc9c0692c1c6aba1b90318 (worker.js from cyberhavenext.pro)
- a8d3027be48f61ae6174d067e59e89b7ec47ae19420470248733d8c4b75fda52 (content.js from cyberhavenext.pro)
- 8ae82bcb5a474ef813d1e2a044ba73cb62aac55a245dfb4eaa30cc3e0451a4d3 (worker.js from readermodeext.info)
- 28dae3b4bb89a034f54d86c52dea0f58cf7e24f5e7504f3cc5569bac1e189bed (content.js from readermodeext.info)
- 7fb43dc45664102d3d66970480832a649574b7e925eb469c7f3357be6a34e1ce (worker.js from vpncity.live)
- f79212c1cc9452bb5dee89937e1736e05e25fe77a1e2581a18421dc6582ff0ce (content.js from vpncity.live)

### Infrastructure Characteristics

- Registration Provider: Namecheap
- Hosting Provider: Vultr
- ASN: 20473
- Web Server: Nginx
- SSL Certificate: Let's Encrypt
- Framework: Laravel PHP
- HTTP Response: 200


### Malicious Files

- content.js
- worker.js
- manifest.json

### Network Indicators

- Dead drop resolver pattern: /6kU.*?"/gm
- HTTP POST requests for data exfiltration
- ChatGPT API connectivity check

### Tracking Compromised extensions : 

- Here is also the full list for tracking compromised extensions by @tuckner :
https://docs.google.com/spreadsheets/d/15xOLbYgz5DQnCWYE6a_LXGcqYC_bNPPzdBqdLofz6-E/edit?pli=1&gid=0#gid=0


### Vulnu Communication : https://www.vulnu.com/p/breaking-cyberhaven-chrome-extension-compromised

## Accounts to Follow : 
- Jaime Blasco : x.com/jaimeblascob/status/1872447430362611810
- Andre Gironda (1) : x.com/AndreGironda/status/1872463896742871095
- Andre Gironda (2) : x.com/AndreGironda/status/1872463919668969788
- Tuckner (1) : x.com/tuckner/status/1872516426038419631
- Tuckner (2) : x.com/tuckner/status/1872516616241758236

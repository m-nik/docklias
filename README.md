# docklias
Docker Command Aliases



```sh
alias dps="docker ps"
alias dimg="docker images"
alias dlog="docker logs -f"
alias dstop="docker stop"
alias dsrt="docker start"
alias drst="docker restart"
alias drm="docker rm"
alias dri="docker rmi"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dex="docker exec -it"
alias dcp="docker cp"
```

### install
##### Simple and quick
```sh
wget https://raw.githubusercontent.com/m-nik/docklias/main/docklias.sh 2>/dev/null && sh docklias.sh && source ~/.docker/.docklias && source ~/.docker/.docklias_completion && rm docklias.sh
```
##### manual
- Add aliases to `~/.docker/.docklias`
- To persist aliases add `source ~/.docker/.docklias` to `~/.bashrc`
- To immediately use aliases run `source ~/.docker/.docklias`

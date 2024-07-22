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
```

### install
- Add aliases to `~/.docker/.docklias`
- To persist aliases add `source ~/.docker/.docklias` to `~/.bashrc` or `~/.profile`
- To immediately use aliases run `source ~/.docker/.docklias`

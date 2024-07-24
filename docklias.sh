#!/bin/bash


mkdir ~/.docker 2>/dev/null | true


echo "alias dps=\"docker ps\"
alias dimg=\"docker images\"
alias dlog=\"docker logs -f\"
alias dstop=\"docker stop\"
alias dsrt=\"docker start\"
alias drst=\"docker restart\"
alias drm=\"docker rm\"
alias dri=\"docker rmi\"
alias dcu=\"docker compose up -d\"
alias dcd=\"docker compose down\"
alias dex=\"docker exec -it\"
" > ~/.docker/.docklias

grep .docklias ~/.bashrc >/dev/null || echo "source ~/.docker/.docklias" >> ~/.bashrc


#!/bin/bash


mkdir ~/.docker 2>/dev/null | true

# aliases
cat <<EOF > ~/.docker/.docklias
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
EOF

cat <<EOF > ~/.docker/.docklias_completion
_docker_alias_complete() {
    local cur="\${COMP_WORDS[COMP_CWORD]}"
    local cmd="\${COMP_WORDS[0]}"
    local options=""
    local items=""

    case "\$cmd" in
        dps)
            options="--all --filter --format --last --latest --no-trunc --quiet --size"
            items=\$(docker ps --format '{{.Names}}' 2>/dev/null)
            ;;
        dimg)
            options="--all --digests --filter --format --no-trunc --quiet"
            items=\$(docker images --format '{{.Repository}}:{{.Tag}}' 2>/dev/null)
            ;;
        dlog)
            options="--details --follow --since --tail --timestamps"
            items=\$(docker ps --format '{{.Names}}' 2>/dev/null)
            ;;
        dstop)
            options="--time"
            items=\$(docker ps --format '{{.Names}}' 2>/dev/null)
            ;;
        dsrt | drst)
            items=\$(docker ps -a --format '{{.Names}}' 2>/dev/null)
            ;;
        drm)
            options="--force --volumes"
            items=\$(docker ps -a --format '{{.Names}}' 2>/dev/null)
            ;;
        dri)
            options="--force --no-prune"
            items=\$(docker images --format '{{.Repository}}:{{.Tag}}' 2>/dev/null)
            ;;
        dcu)
            options="--build --detach --no-deps --remove-orphans --scale --quiet-pull"
            items=\$(docker compose config --services 2>/dev/null)
            ;;
        dcd)
            options="--remove-orphans --timeout"
            items=\$(docker compose config --services 2>/dev/null)
            ;;
        dex)
            options="--detach --env --workdir"
            items=\$(docker ps --format '{{.Names}}' 2>/dev/null)
            ;;
    esac

    # Combine flags and items for completion
    COMPREPLY=( \$(compgen -W "\$options $items" -- "$cur") )
}

complete -F _docker_alias_complete dps
complete -F _docker_alias_complete dimg
complete -F _docker_alias_complete dlog
complete -F _docker_alias_complete dstop
complete -F _docker_alias_complete dsrt
complete -F _docker_alias_complete drst
complete -F _docker_alias_complete drm
complete -F _docker_alias_complete dri
complete -F _docker_alias_complete dcu
complete -F _docker_alias_complete dcd
complete -F _docker_alias_complete dex
EOF


grep .docklias ~/.bashrc >/dev/null || echo "source ~/.docker/.docklias" >> ~/.bashrc
grep .docklias_completion ~/.bashrc >/dev/null || echo "source ~/.docker/.docklias_completion" >> ~/.bashrc

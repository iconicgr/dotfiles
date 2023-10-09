alias ll='ls -lh --color'
alias la='ls -lha --color'
alias du='du -hd 1'
alias c='clear'
alias df='df -H -T | grep -v -E "tmpfs|overlay"'
alias neo='clear;neofetch;cowsay "BTW I use Debian"'
alias sub='du -sh ./*'
#alias up='sudo pacman -Syu'
alias up='sudo apt update; sudo apt upgrade'
alias vpnup='sudo systemctl start zerotier-one'
alias vpndown='sudo systemctl stop zerotier-one'
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'
alias ga='git add .'

alias glances="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock:ro --pid host --network host -it docker.io/nicolargo/glances"

alias up="docker compose up -d"
alias down="docker compose down"
alias build="docker compose build"
alias exec='_foo() { docker exec -it $1 /bin/bash; }; _foo'
alias tree='tree -L 2'

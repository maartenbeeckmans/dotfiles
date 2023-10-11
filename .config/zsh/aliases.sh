#!/bin/zsh

# General
alias paruinstall="paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S"
alias bincat="/bin/cat"
alias cat="bat -p"
alias gup="git pull --rebase; git submodule --quiet sync; git submodule update --init --recursive"
alias ip="ip -c"
alias vi="vim"
alias vim="nvim -p"
alias externalip="curl --silent 'https://api.ipify.org?format=json' | jq -r '.ip'"
alias history="fc -i -n -l 0"

# Inuits
alias inuitssshuttleopen='sshuttleopen proxy02.inuits.eu:443'
alias inuitsovhsshuttleopen='sshuttleopen proxy03.inuits.eu:443'
alias inuitsdc10sshuttleopen='sshuttleopen proxy04.inuits.eu:443'
alias inuitsvault='export VAULT_ADDR=https://vault.mgmtprod.inuits.eu:8200; export VAULT_TOKEN=$(vault login -method=oidc -token-only)'
alias proxy03socks5open='sshsocks5open proxy03.inuits.eu'
alias proxy04socks5open='sshsocks5open proxy04.inuits.eu'
alias proxy03socks5close='sshsocks5close proxy03.inuits.eu'
alias proxy04socks5close='sshsocks5close proxy04.inuits.eu'

alias fixarchmirrors="sudo reflector -c Belgium,France,Germany,Nederlands --sort rate --latest 60 --save /etc/pacman.d/mirrorlist"

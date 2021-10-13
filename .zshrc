###############################################################
#  _________  _   _             ____             __ _        ##
# |__  / ___|| | | |_ __ ___   / ___|___  _ __  / _(_) __ _  ##
#   / /\___ \| |_| | '__/ __| | |   / _ \| '_ \| |_| |/ _` | ##
#  / /_ ___) |  _  | | | (__  | |__| (_) | | | |  _| | (_| | ##
# /____|____/|_| |_|_|  \___|  \____\___/|_| |_|_| |_|\__, | ##
#                                                     |___/  ##
#                                                            ##
###############################################################
## Made by: Maarten Beeckmans                                ##
###############################################################

###############################################################
# oh-my-zsh configuration                                     #
###############################################################
# Path to your oh-my-zsh installation.
export ZSH="/home/$(whoami)/.oh-my-zsh"

###############################################################
# ZSH Theme                                                   #
###############################################################
# Using agnoster theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use hyphen-insensitive completion.
# Enable hyphen-insensitive completion ('-' and '_')
HYPHEN_INSENSITIVE="true"

###############################################################
# oh-my-zsh plugins                                           #
###############################################################
plugins=(
  autojump
  archlinux
  battery
  colored-man-pages
  command-not-found
  common-aliases
  fzf
  git
  nmap
  nomad
  python
  rsync
  ssh-agent
  systemd
  thefuck
  vagrant
  vi-mode
)
source $ZSH/oh-my-zsh.sh

###############################################################
# Aliasses                                                    #
###############################################################
alias inuitssshuttleopen='sshuttleopen proxy02.inuits.eu:443'
alias localsshuttleopen='sshuttleopen proxy.management.beeckmans.cloud'
alias homelabsshuttleopen='sshuttleopen proxy.beeckmans.cloud:8443'
alias hetznersshuttleopen='sshuttleopen vpngateway-hetzner.beeckmans.cloud:8443'
alias gup="git pull --rebase; git submodule --quiet sync; git submodule update --init --recursive"
alias gc="git commit --signoff"
alias i3config="vim $HOME/.config/i3/config"
alias zshrc="vim $HOME/.zshrc"
alias gr="echo '\033[0;31m Use ag instead of grep! \033[0m'"
alias vi="vim"
alias vim="nvim -p"
alias vimwiki="vim $HOME/vimwiki/index.wiki"
alias externalip="curl --silent 'https://api.ipify.org?format=json' | jq"
alias ll="exa --long --header --git"
alias ip="ip -c"
alias aursearch="paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S"
alias search="sk --ansi -i -c 'ag --color \"{}\"'"
alias fixmirrot="sudo reflector -c Belgium,France,Germany,Nederlands --sort rate --latest 60 --save /etc/pacman.d/mirrorlist"
alias cat="bat -p"
alias realcat="cat"

###############################################################
# Functions                                                   #
###############################################################
function validatepuppet () {
  for puppet_file in $(find -name '*.pp' -type f)
  do
    echo "validating ${puppet_file}"
    sudo puppet parser validate $puppet_file
  done
  for puppet_epp_file in $(find -name '*.epp' -type f)
  do
    echo "validating ${puppet_epp_file}"
    sudo puppet epp validate $puppet_epp_file
  done
}

function sshtunnel () {
  ssh -NL ${1} proxy_inuits &
}

function sshuttleopen () {
  local SSH_JUMPHOST=${1}

  if [ -f /tmp/sshuttle.pid > /dev/null ]
  then 
    echo "There is already a sshuttle tunnel active with PID $(cat /tmp/sshuttle.pid), not creating a new one..."
  else
    sshuttle --dns -vvr ${SSH_JUMPHOST} 0.0.0.0/0 -x ${SSH_JUMPHOST} -D --pidfile /tmp/sshuttle.pid
  fi
}

function sshuttleclose () {
  if [ -f /tmp/sshuttle.pid > /dev/null ]
  then 
    killall sshuttle
  else
    echo 'Sshuttle not active ...'
  fi
}

function fixdns () {
  nmcli -g name,type connection  show  --active | awk -F: '/ethernet|wireless/ { print $1 }' | while read connection
  do
    nmcli con mod "$connection" ipv6.ignore-auto-dns yes
    nmcli con mod "$connection" ipv4.ignore-auto-dns yes
    nmcli con mod "$connection" ipv4.dns "1.1.1.1 8.8.8.8"
    nmcli con down "$connection" && nmcli con up "$connection"
  done
}

autoload validatepuppet
autoload sshtunnel
autoload sshuttleopen
autoload sshuttleclose
autoload fixdns
###############################################################
# Environment Variables                                       #
###############################################################
export TERM=xterm-color
export EDITOR=nvim
export LANG=en_US.UTF-8
export VAGRANT_DEFAULT_PROVIDER=libvirt
export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway

###############################################################
# Theme settings                                              #
###############################################################
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
autoload -U compinit; compinit

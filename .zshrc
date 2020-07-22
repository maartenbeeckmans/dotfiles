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
# Using powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use hyphen-insensitive completion.
# Enable hyphen-insensitive completion ('-' and '_')
HYPHEN_INSENSITIVE="true"

###############################################################
# oh-my-zsh plugins                                           #
###############################################################
plugins=(
  archlinux
  battery
  colored-man-pages
  command-not-found
  common-aliases
  firewalld
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
alias sshuttleopen='sshuttle --dns -vvr proxy02.inuits.eu:443 0.0.0.0/0 -x proxy02.inuits.eu:443 -D --pidfile /tmp/inuits.pid'
alias sshuttleclose='if [ -f /tmp/inuits.pid > /dev/null ]; then killall sshuttle; else echo Tunnel not active;fi'
alias gup="git pull --rebase; git submodule --quiet sync; git submodule update --init --recursive"
alias i3config="vim $HOME/.config/i3/config"
alias zshrc="vim $HOME/.zshrc"
alias gr="grep -r"
alias vi="vim"
alias vimwiki="vim $HOME/vimwiki/index.wiki"
alias externalip="curl https://icanhzip.com"

###############################################################
# Environment Variables                                       #
###############################################################
export TERM=xterm-color
export EDITOR=vim
export LANG=en_US.UTF-8

###############################################################
# Theme settings                                              #
###############################################################
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

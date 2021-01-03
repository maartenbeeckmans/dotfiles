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
alias sshuttleopen='sshuttle --dns -vvr proxy02.inuits.eu:443 0.0.0.0/0 -x proxy02.inuits.eu:443 -D --pidfile /tmp/inuits.pid'
alias sshuttleclose='if [ -f /tmp/inuits.pid > /dev/null ]; then killall sshuttle; else echo Tunnel not active;fi'
alias gup="git pull --rebase; git submodule --quiet sync; git submodule update --init --recursive"
alias i3config="vim $HOME/.config/i3/config"
alias zshrc="vim $HOME/.zshrc"
alias gr="echo '\033[0;31m Use ag instead of grep! \033[0m'"
alias vi="vim"
alias vim="nvim"
alias vimwiki="vim $HOME/vimwiki/index.wiki"
alias externalip="curl https://icanhzip.com"
alias laptoponly="$HOME/.screenlayout/laptoponly.sh"
alias 2screens="$HOME/.screenlayout/2screensvertical.sh"
alias pulptunnel="echo 'Pulp 3 mgmtdev is now available at http://localhost/pulp/api/v3/status/'; ssh -NL 80:pulp3.mgmtdev:80 proxy_inuits"
alias firefox="MOZ_ENABLE_WAYLAND=1 firefox"

###############################################################
# Functions                                                   #
###############################################################
function removesubmodule () {
  git submocule deinit -f -- $1
  rm -rf .git/modules/$1
  git rm -f $1
}
function checkpuppet () {
  export BUNDLE_GEMFILE=~/.rake/Gemfile
  bundle install --gemfile=~/.rake/Gemfile
  echo "Testing puppet syntax"
  bundle exec rake --rakefile=~/.rake/rakefile_syntax syntax::manifests
  echo "Testing templates syntax"
  bundle exec rake --rakefile=~/.rake/rakefile_syntax syntax::templates
  echo "Testing hiera syntax"
  bundle exec rake --rakefile=~/.rake/rakefile_syntax syntax::hiera
  echo "Testing puppet lint"
  bundle exec rake --rakefile=~/.rake/rakefile_lint lint
  echo "All tests checked"
}
function sshtunnel () {
  ssh -NL ${1} proxy_inuits &
}
autoload removesubmodule 
autoload checkpuppet
autoload sshtunnel
###############################################################
# Environment Variables                                       #
###############################################################
export TERM=xterm-color
export EDITOR=nvim
export LANG=en_US.UTF-8
export VAGRANT_DEFAULT_PROVIDER=libvirt
export MOZ_ENABLE_WAYLAND=1

###############################################################
# Theme settings                                              #
###############################################################
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

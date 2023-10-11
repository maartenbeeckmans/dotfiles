#!/bin/zsh

function sshtunnel () {
  ssh -NL ${1} proxy03_inuits &
}

function sshsocks5open() {
  local target=${1}
  ssh -D 127.0.0.1:5555 -q -N ${target} &
  export http_proxy=socks5h://127.0.0.1:5555
  export HTTPS_PROXY=socks5h://127.0.0.1:5555
  export ALL_PROXY=socks5h://127.0.0.1:5555
}

function sshsocks5close() {
  local target=${1}
  local pid=$(lsof -t -i :5555 -s TCP:LISTEN)
  kill -9 $pid
  unset http_proxy
  unset HTTPS_PROXY
  unset ALL_PROXY
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

function starttmux () {
  if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
      tmux attach || tmux >/dev/null 2>&1
  fi
}

autoload sshtunnel
autoload sshsocks5open
autoload sshsocks5close
autoload sshuttleopen
autoload sshuttleclose
autoload custom_history
autoload starttmux

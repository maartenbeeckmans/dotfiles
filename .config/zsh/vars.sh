#!/bin/zsh

export TERM=xterm-256color
export EDITOR=nvim
export LANG=en_US.UTF-8
export VAGRANT_DEFAULT_PROVIDER=libvirt
export VAGRANT_NO_PARALLEL=1
export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway
export PROMPT_EOL_MARK='' # no % after partial line
export BAT_THEME="gruvbox-light"
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

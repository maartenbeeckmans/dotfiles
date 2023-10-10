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
SHELL_DIR=$HOME/.config/zsh

###############################################################
# Settings                                                    #
###############################################################
setopt autocd                   # Auto cd when executing directory
setopt prompt_subst             # Required for prompt
setopt auto_pushd               # Automatically use pushd
setopt pushd_ignore_dups        # Pushd will ignore duplicates
setopt pushdminus               # Allow numbers
setopt auto_menu                # Show completion menu on tab
setopt complete_in_word         # Completion from both ends
setopt always_to_end            # Move cursor to end on completion

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

stty -ixon                      # Disable XON/XOFF Control
unsetopt flowcontrol            # Disable flowcontrol
unsetopt menu_complete          # Don't autoselect first entry
unsetopt beep                   # Fuck beeps

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

###############################################################
# Aliasses                                                    #
###############################################################
source $SHELL_DIR/aliases.sh

###############################################################
# Functions                                                   #
###############################################################
source $SHELL_DIR/functions.sh

###############################################################
# Environment Variables                                       #
###############################################################
source $SHELL_DIR/vars.sh

###############################################################
# Prompt                                                      #
###############################################################
source $SHELL_DIR/prompt.sh

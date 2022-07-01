#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias g="git"
alias gb="git branch"
alias gd="git diff"
alias gl="git log"
alias gp="git pull"
alias gs="git status"

export EDITOR=vim

export PATH=$PATH:$HOME/bin

# https://unix.stackexchange.com/a/17856
for path in $HOME/bin/*/bin; do PATH="$path:$PATH"; done

# AltGr + a/e/i/o/u = á/é/í/ó/ú
setxkbmap -layout us -variant altgr-intl

# Don't do anything when pressing Caps Lock alone, but move cursor
# left/down/up/right when pressing CapsLock + h/j/k/l
xmodmap -e 'keycode 66 = Mode_switch'
xmodmap -e 'keysym h = h H Left'
xmodmap -e 'keysym l = l L Right'
xmodmap -e 'keysym k = k K Up'
xmodmap -e 'keysym j = j J Down'

# https://wiki.archlinux.org/index.php/bash#Auto_%22cd%22_when_entering_just_a_path
shopt -s autocd

eval "$(starship init bash)"

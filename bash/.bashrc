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

setxkbmap -option caps:swapescape
setxkbmap -layout us -variant altgr-intl

# https://wiki.archlinux.org/index.php/bash#Auto_%22cd%22_when_entering_just_a_path
shopt -s autocd

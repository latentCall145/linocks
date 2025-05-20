shopt -s autocd # cd just by typing directory name

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

xset r rate 250 45; # speed up ubuntu keyboard repeat keys: nice
#export PATH="/usr/cuda/bin" #:$PATH
export PATH="~/.local/bin" #:$PATH
export PATH="/snap/bin":$PATH
export PATH="/sbin":$PATH
export PATH="/usr/local/cuda/bin":$PATH
export PATH="/usr/local/bin":$PATH
export PATH="/usr/local":$PATH
export PATH="/usr/bin":$PATH
export PATH="/usr/share/vim":$PATH
#export LD_LIBRARY_PATH="/home/trtx/.local/miniforge3/lib":$LD_LIBRARY_PATH # if a program needs this, but enabling this everywhere messes up terminal and vim
export LD_LIBRARY_PATH="/usr/local/cuda/extras/CUPTI/lib64":$LD_LIBRARY_PATH
export LD_LIBRARY_PATH="/usr/local/cuda/lib64":$LD_LIBRARY_PATH
export LD_LIBRARY_PATH="/usr/local/lib":$LD_LIBRARY_PATH
export LD_LIBRARY_PATH="/usr/lib":$LD_LIBRARY_PATH
#export CUDA_HOME="/usr/local/cuda"
#export CUDA_VISIBLE_DEVICES=0
export EDITOR=vim
export NNN_PLUG='c:fzcd;o:fzopen;p:preview-tui;d:diffs;v:imgview'

#alias python3=~/.local/miniconda3/bin/python3
#alias py=~/.local/miniconda3/bin/python3
alias py=python3
alias pip=pip3
alias yt="~/.scripts/yt.sh $1"
alias ythr="~/.scripts/ythr.sh $1"
alias dlVid="~/.scripts/dlVid.sh $1"
alias vic='vim ~/.config/i3/config'
alias vb='vim ~/.bashrc; source ~/.bashrc'
alias vim='vim -p'
alias trash="mv -t ~/.trash"
alias du="du -h"

fcdd() {
  cd "$(find ${1:-.} -type d | fzf)" # ${1} = 1st arg, :-~ = use "~" if no arg specified
}
fcd() {
  selected_file=$(find ${1:-.} | fzf)
  cd $(dirname $selected_file$)
}

mcd() { # mamba cd
  cd ~/.local/miniforge3/envs/${1:-main}/lib/python3.1/site-packages
}

open() {
  selected_file=$(find ${1:-.} | fzf)
  nohup xdg-open "$selected_file" > /tmp/nohup.out & disown
}

cpuclocks() {
  watch -n0.2 "grep MHz /proc/cpuinfo | awk '{print \$4}' | sort -nr"
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/trtx/.local/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/trtx/.local/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/trtx/.local/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/trtx/.local/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/trtx/.local/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/trtx/.local/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
. "$HOME/.cargo/env"

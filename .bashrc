# My bashrc, modified by copykatt [Fri. 19. Jul, 2013]
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# rails
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

alias ls='ls --color=auto'
# Colorful prompt (light green)
export PS1="\e[1;32m[\\@\\u@\\H:\\W]\\$\e[m "
#############################################################################################
# Extract tarballs (alternatives: unp package, tar xvf)
extract () {
  if [ -f $1 ] ; then 
    case $1 in 
      *.tar.bz2)  tar xvjf $1   ;;
      *.tar.gz)   tar xvzf $1   ;;
      *.bz2)      bunzip2  $1   ;;
      *.rar)      unrar x  $1   ;;
      *.gz)       gunzip   $1   ;;
      *.tar)      tar xvf  $1   ;;
      *.tbz2)     tar xvjf $1   ;;
      *.tgz)      tar xvzf $1   ;;
      *.zip)      unzip    $1   ;;
      *.Z)        uncompress $1 ;;
      *.7z)       7z x     $1   ;;
      *)          echo "Me not know how extract this *sob* '$1' ..." ;;
   esac
 else
    echo "'$1' is not a valid file. Me sad now :("
 fi
}
####################################################################################################
# Colored man pages (altenatives: package most and using it as MANPAGE env variable ex. under #most)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m' 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#most
#export PAGER="/usr/bin/most -s"
####################################################################################################
# Aliases for commands
# cd)
alias ..="cd .." #home
alias ...="cd ../.." #root
alias ....="cd ../../.." 
alias .....="cd ../../../.."
alias c="cd"
alias d="cd"
# ls
alias ll="ls -l"
alias lo="ls -o"
alias lh="ls -lh"
alias la="ls -la"
alias sl="ls" #typo
alias l="ls"
alias s="ls"
# wc
alias wl="wc -l"
#PWD
alias p="$PWD"
#Folders sorted by disk usage
alias folders='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
###################################################################################################
# History control (10,000 lines of history) run with: history | grep foo
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
#Combine multiline commands into one in history
shopt -s cmdhist
#Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"
###################################################################################################
# cd into last changed dir
cl() {
  last_dir="$(ls -Frt | grep '/$' | tail -n1)"
  if [ -d "$last_dir" ]; then 
          cd "$last_dir"
  fi
}
# Keep bookmarks of often used dirs
rd() {
  pwd > "$HOME/.lastdir_$1"
}

crd() {
  lastdir="$(cat "$HOME/.lastdir_$1")">/dev/null 2>$1
  if [ -d "$lastdir" ]; then 
          cd "$lastdir"
  else
          echo "no existing directory stored in buffer$1">$2
  fi
}
#copy and go to dir (is not working properly...)
#cpg () {
#  if [ -d "$2" ]; then
#     cp $1 $2 && cd $2
#  else
#     cp $1 $2
#  fi
#}
#move and go to dir
#mvg () {
#  if [ -d "$2" ]; then 
#    mv $1 $2 && cd $2
#  else
#    mv $1 $2 
#  fi
#}
############################################################################3#####################

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

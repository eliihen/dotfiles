################
#  ZSH config  #
################

# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="flazz"

plugins=(
  gpg-agent         # Auto-launch gpg-agent (also as ssh-agent)
  vi-mode           # Proper support for vi-mode in shell
  pj                # cd to local projects with completions
  safe-paste        # Make pasting into the shell more safe
  colored-man-pages # The name says it all
  git               # git completions
  mvn               # Maven completions
  systemd           # systemd completions
)

# "Launch" OMZ
source $ZSH/oh-my-zsh.sh


###########################
#  Environment variables  #
###########################

path=(
  /usr/local/bin
  /usr/bin
  /bin
  /usr/local/sbin
  /usr/sbin
  /opt/local/bin
  /local/java/jdk/bin
  $HOME/.local/bin
  $HOME/bin
  $HOME/workspace/oms/deploy
  $HOME/workspace/oms/util
  /local/collect/default/product/bin
)

# Google Go
# export GOROOT=$HOME/golang/go
export GOPATH=$HOME/golang/bin

export LANG=en_US.UTF-8
export EDITOR=vim
export PAGER=less
export TERM=rxvt-unicode-256color

export SVNROOT=svn+ssh://svn.osl.manamind.com/export/svn
export JAVA_HOME=/local/java/jdk1.8.0_51
export ANT_HOME="/usr/share/ant/"
export COLLECT_HOME="/local/collect/default"
export COLLECT_DOMAIN="/local/home/c_hb/domain"
export DEPLOYSCRIPT_DIR="/home/espen/workspace/oms/deploy"
export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"

# Work VPN is old
export NSS_HASH_ALG_SUPPORT=+MD5
export OPENSSL_ENABLE_MD5_VERIFY=1

export GPG_KEY=0E25CFCC

# extend limit of concurrent watched files to avoid grunt error
ulimit -n 2048


#############
#  Aliases  #
#############

alias java8='export JAVA_HOME=/local/java/jdk1.8.0_51'
alias java7='export JAVA_HOME=/local/java/jdk1.7.0_79'
alias java6='export JAVA_HOME=/local/java/jdk1.6.0_31'

alias work="cd $HOME/workspace/oms"

# Not all servers support rxvt-univode-256color,
# use something safe instead
alias ssh="TERM=xterm ssh"

alias gu="git up"


#############################
#  Built-in zsh mail check  #
#############################

# Build mailpath array from folders in Maildir
# This makes zsh check isync maildirs for new mail
unset mailpath
mailpref=$HOME/Maildir
mailpath=( $(ls -d $mailpref/*) )


###################
#  PJ - projects  #
###################

PROJECT_PATHS=(
  $HOME/workspace/oms
  $HOME/workspace/vps
  $HOME/workspace/espen
  $HOME/workspace/diverse
)


####################
#  password-store  #
####################

export PASSWORD_STORE_DIR="$HOME/ownCloud/Documents/passwords/password_store"


####################
#  vi-mode prompt  #
####################

export MODE_INDICATOR="%{$fg_bold[white]%}%{$bg[yellow]%} NORMAL %{$reset_color%}"


#########
#  NVM  #
#########

export NVM_DIR="/home/espen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


#########
#  FZF  #
#########

export FZF_DEFAULT_OPTS="--exact"
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh


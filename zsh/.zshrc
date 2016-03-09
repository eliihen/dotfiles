################
#  ZSH config  #
################

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="miloshadzic"

plugins=(git)

source $ZSH/oh-my-zsh.sh

###########################
#  Environment variables  #
###########################

# Google Go
# export GOROOT=$HOME/golang/go
export GOPATH=$HOME/golang/bin

export PATH="/local/java/jdk/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/espen/.local/bin:/home/espen/bin:/usr/local/bin:$PATH:/opt/local/bin:/home/espen/workspace/oms/deploy:/home/espen/workspace/oms/util:"

export LANG=en_US.UTF-8
export EDITOR=vim
export TERM=rxvt-unicode-256color

export SVNROOT=svn+ssh://svn.osl.manamind.com/export/svn
export JAVA_HOME=/local/java/jdk1.8.0_51
export FLEX_HOME="/local/flex"
export ANT_HOME="/usr/share/ant/"
export COLLECT_HOME="/local/collect/default"
export COLLECT_DOMAIN="/local/home/c_hb/domain"
export DEPLOYSCRIPT_DIR="/home/espen/workspace/oms/deploy"

# Work VPN is old
export NSS_HASH_ALG_SUPPORT=+MD5
export OPENSSL_ENABLE_MD5_VERIFY=1

# extend limit of concurrent watched files to avoid grunt error
ulimit -n 2048

#############
#  Aliases  #
#############

alias java1.8='export JAVA_HOME=/local/java/jdk1.8.0_51'
alias java1.7='export JAVA_HOME=/local/java/jdk1.7.0_79'
alias java1.6='export JAVA_HOME=/local/java/jdk1.6.0_31'

alias work="cd ~/workspace/oms"
alias deploys="cd ~/workspace/oms/deploy/full-deploy"
alias afm="cd ~/workspace/oms/cust_afm/trunk/webapp"
alias fish="cd ~/workspace/oms/cust_fishpool/trunk/webapp"
alias vip="cd ~/workspace/vps/vip-gui/investorportal-web"
alias dn="cd /home/espen/workspace/oms/cust_dnfinans/trunk/webapp"
alias hb="cd /home/espen/workspace/oms/hb/client"
alias jaws="cd /home/espen/workspace/oms/jaws"
alias rested="cd ~/workspace/diverse/RESTED"

# Not all servers support rxvt-univode-256color
alias ssh="TERM=xterm ssh"

alias gu="git up"

###############
#  Functions  #
###############

# Usage: lg hb hb-collect warn
lg() {
  local level=${3:-debug}

  if [ -z "$1" ]; then
    echo Project is required
  elif [ "$2" == "catalina" ]; then
    $PAGER /local/home/c_$1/catalina/logs/catalina.out
  elif [ -z "$2" ]; then
    $PAGER /local/home/c_$1/catalina/logs/$1.$level.log
  else
    $PAGER /local/home/c_$1/catalina/logs/$2.$level.log
  fi
}

# Usage: rc hb start
rc() {
  if [ -z "$1" ]; then
    echo Project is required
  elif [ -z "$2" ]; then
    echo action is required
  else
    /local/home/c_$1/catalina/rc $2
  fi
}

# Usage: logs hb
logs() {
  if [ -z "$1" ]; then
    cd /local/home
  else
    cd /local/home/c_$1/catalina/logs
  fi
}

############################
#  GPG agent as SSH agent  #
############################

unset GPG_AGENT_INFO

pgrep "gpg-agent" > /dev/null
if [ $? != 0 ]; then
  gpg-agent --daemon --enable-ssh-support
fi

export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
fi


#export GPG_AGENT_INFO
#export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
#export SSH_AGENT_PID="$(pgrep gpg-agent)"

export GPG_TTY=$(tty)

export GPGKEY=0E25CFCC

##########
#  TMUX  #
##########

# Use i3 instead of tmux
# if [[ ! "$TMUX" ]] && [[ $(tty | fgrep pts) ]] && [[ ! $SSH_CONNECTION ]]
# then
#   tmux
# fi

#########
#  NVM  #
#########

export NVM_DIR="/home/espen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


#########
#  FZF  #
#########

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


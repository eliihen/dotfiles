################
#  ZSH config  #
################

# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="flazz"


#################
#  ZSH Plugins  #
#################

# Check if oh-my-zsh is installed
if [ ! -d $ZSH ]; then
  echo --------------------------
  echo   Installing Oh-my-zsh
  echo --------------------------
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install custom plugins
if [ ! -d $ZSH/custom/plugins/zsh-nvm/ ]; then
  echo --------------------------
  echo    Installing zsh-nvm
  echo --------------------------
  git clone https://github.com/lukechilds/zsh-nvm $ZSH/custom/plugins/zsh-nvm
fi

plugins=(
  zsh-nvm           # Node version manager
  vi-mode           # Proper support for vi-mode in shell
  pj                # cd to local projects with completions
  safe-paste        # Make pasting into the shell more safe
  colored-man-pages # The name says it all
  git               # git completions
  mvn               # Maven completions
  systemd           # systemd completions
)

# "Launch" Oh-My-Zsh
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

# Add rustup to PATH
source $HOME/.cargo/env

# Google Go
# export GOROOT=$HOME/golang/go
export GOPATH=$HOME/golang/bin

export LANG=en_US.UTF-8
export EDITOR=nvim
export PAGER=less
export BROWSER=firefox-developer
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

# Fix java apps for non-re-parenting window managers (like sway)
export _JAVA_AWT_WM_NONREPARENTING=1

# Taskwarrior config file
export TASKRC=$HOME/.config/task/config

# extend limit of concurrent watched files to avoid grunt error
ulimit -n 2048


#############
#  Aliases  #
#############

alias java8='export JAVA_HOME=/local/java/jdk1.8.0_51'
alias java7='export JAVA_HOME=/local/java/jdk1.7.0_79'
alias java6='export JAVA_HOME=/local/java/jdk1.6.0_31'

alias work="cd $HOME/workspace/oms"

alias s="sudo"

# Not all servers support rxvt-univode-256color,
# use something safe instead
alias ssh="TERM=xterm ssh"

alias gu="git up"
alias gcd="git checkout develop"
alias gds="git diff --staged"
alias gc-="git checkout -"
alias glg="git log --stat --show-signature"

alias yst="yadm status"
alias ya="yadm add"
alias yd="yadm diff"
alias yds="yadm diff --staged"
alias yc="yadm commit"
alias yp="yadm push"

# I use a gutility for git-flow called gf, no need for git-fetch alias
unalias gf

# Use most recent version by default
nvm use node > /dev/null


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


###############
#  gpg-agent  #
###############

export GPG_KEY=0E25CFCC
export GPG_TTY=$(tty)

# Fedora places the gpg-agent ssh socket in a weird place
if [ -f /etc/redhat-release ]; then
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
else
  export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
fi

# ssh does not auto-launch gpg-agent, we do it manually
gpgconf --launch gpg-agent


#########
#  FZF  #
#########

export FZF_DEFAULT_OPTS="--exact"
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh


#####################
#  Print to prompt  #
#####################

export todo() {
  # Print taskwarrior todos
  if hash task 2>/dev/null; then
    task next
  fi

  # Print today's CalDav appointments
  if hash khal 2>/dev/null; then
    khal agenda
  fi
}

todo


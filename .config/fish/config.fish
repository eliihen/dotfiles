#######################
#  Fish Shell Config  #
#######################

set fish_greeting                   # Disable greeting message
set -g fish_prompt_pwd_dir_length 9 # Set prompt directory name length

fish_vi_key_bindings                # Use vi key bindings

########################
#  Oh my fish plugins  #
########################

# It kind of sucks that there is no pj for fish..
# Recreate pj with jump by using this script
set PROJECT_PATHS \
  $HOME/workspace/oms \
  $HOME/workspace/vps \
  $HOME/workspace/espen \
  $HOME/workspace/diverse
function update_markpath
  for directory in (find $PROJECT_PATHS -maxdepth 1 -type d)
      cd $directory
      mark (basename $directory) $directory
  end
end

set -gx MARKPATH $HOME/.config/markpath  # Marks for jump

set -g theme_powerline_fonts no


###########################
#  Environment variables  #
###########################

set -gx PATH \
  /usr/local/bin \
  /usr/bin \
  /bin \
  /usr/local/sbin \
  /usr/sbin \
  $HOME/bin \
  $HOME/workspace/oms/deploy \
  $HOME/workspace/oms/util \
  /local/collect/default/product/bin \
  $HOME/.fzf/bin \
  $HOME/.cargo/bin

set -gx EDITOR nvim
set -gx LANG en_US.UTF-8
set -gx BROWSER firefox-nightly
set -gx TERM rxvt-unicode-256color

# Work VPN is old
set -gx NSS_HASH_ALG_SUPPORT +MD5
set -gx OPENSSL_ENABLE_MD5_VERIFY 1

# Fix java apps for non-re-parenting window managers (like sway)
set -gx _JAVA_AWT_WM_NONREPARENTING 1

# Taskwarrior config file
set -gx TASKRC $HOME/.config/task/config

set -gx PASSWORD_STORE_DIR $HOME/ownCloud/Documents/passwords/password_store


###################
#  Abbrebiations  #
###################

abbr -a "work cd $HOME/workspace/oms"
abbr -a "j jump"
abbr -a "s sudo"

# Git abbreviations
abbr -a "g git"
abbr -a "gst git status"
abbr -a "glg git log --stat --show-signature"
abbr -a "gd git diff"
abbr -a "gds git diff --staged"
abbr -a "gu git up"
abbr -a "gcm git checkout master"
abbr -a "gcd git checkout develop"
abbr -a "gc- git checkout -"

# yadm abbreviations
abbr -a "yst yadm status"
abbr -a "ya yadm add"
abbr -a "yd yadm diff"
abbr -a "yds yadm diff --staged"
abbr -a "yc yadm commit"
abbr -a "yp yadm push"


#############
#  Aliases  #
#############

# Not all servers support rxvt-unicode-256color,
# use something safe instead
alias ssh="TERM=xterm ssh"

alias java8='export JAVA_HOME=/local/java/jdk1.8.0_51'
alias java7='export JAVA_HOME=/local/java/jdk1.7.0_79'
alias java6='export JAVA_HOME=/local/java/jdk1.6.0_31'


###############
#  gpg-agent  #
###############

set -gx GPG_KEY 0E25CFCC
set -gx GPG_TTY (tty)

set -gx SSH_AUTH_SOCK /run/user/$UID/gnupg/S.gpg-agent.ssh

# ssh does not auto-launch gpg-agent, we do it manually
gpgconf --launch gpg-agent


#######################
#  Load key bindings  #
#######################

function fish_user_key_bindings
  fzf_key_bindings
end


#####################
#  Print to prompt  #
#####################

#export todo() {
#  # Print taskwarrior todos
#  if hash task 2>/dev/null; then
#    task next
#  fi
#
#  # Print today's CalDav appointments
#  if hash khal 2>/dev/null; then
#    khal agenda
#  fi
#}
#
#todo
#

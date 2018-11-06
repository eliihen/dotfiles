#######################
#  Fish Shell Config  #
#######################

set fish_greeting                   # Disable greeting message
set -g fish_prompt_pwd_dir_length 9 # Set prompt directory name length

fish_vi_key_bindings                # Use vi key bindings

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish


###########################
#  Environment variables  #
###########################

set -gx PATH \
  $HOME/bin \
  /usr/local/bin \
  /usr/bin \
  /bin \
  /usr/local/sbin \
  /usr/sbin \
  $HOME/workspace/oms/deploy \
  $HOME/workspace/oms/util \
  $HOME/.jx/bin \
  /local/collect/default/product/bin \
  $HOME/.fzf/bin \
  $HOME/.yarn/bin \
  $HOME/.cargo/bin

set -gx EDITOR nvim
set -gx LANG en_US.UTF-8
set -gx BROWSER firefox-nightly
set -gx TERM xterm-256color
set -gx COLORTERM xterm-256color

set -gx COLLECT_HOME /local/collect/collect-6.12.9
set -gx COLLECT_DOMAIN /local/home/c_sben/domain

set -gx COLLECT_HOME /local/collect/default
set -gx COLLECT_DOMAIN /local/home/c_hb/domain
set -gx JAVA_HOME /local/java/jdk1.8.0_172
set -gx FLEX_HOME /local/flex
set -gx ANT_HOME /usr/share/ant/

set -gx COLLECT_HOME /local/collect/default
set -gx COLLECT_DOMAIN /local/home/c_sben/domain

# Work VPN is old
set -gx NSS_HASH_ALG_SUPPORT +MD5
set -gx OPENSSL_ENABLE_MD5_VERIFY 1

# GTK HiDPI
# TODO: Only for fenrir
set -gx GTK_DPI_SCALE 1.2

# Fix java apps for non-re-parenting window managers (like sway)
set -gx _JAVA_AWT_WM_NONREPARENTING 1

# Taskwarrior config file
set -gx TASKRC $HOME/.config/task/config

set -gx PASSWORD_STORE_DIR $HOME/Nextcloud/Documents/passwords/password_store
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

# The fish pj plugin
set -gx PROJECT_PATHS $HOME/workspace/*


###################
#  Abbrebiations  #
###################

abbr -a work cd $HOME/workspace/oms
abbr -a j pj
abbr -a jo pj open
abbr -a s sudo
abbr -a pd prevd

# Git abbreviations
abbr -a g git
abbr -a gst git status
abbr -a glg git log --stat --show-signature
abbr -a ga git add
abbr -a gd git diff
abbr -a gc git commit
abbr -a gp git push
abbr -a gds git diff --staged
abbr -a gu git up
abbr -a gcm git checkout master
abbr -a gcd git checkout develop
abbr -a gc- git checkout -

# yadm abbreviations
abbr -a yst yadm status
abbr -a ya yadm add
abbr -a yd yadm diff
abbr -a yds yadm diff --staged
abbr -a yc yadm commit
abbr -a yp yadm push

abbr -a java8 set -gx JAVA_HOME /local/java/jdk1.8.0_51
abbr -a java7 set -gx JAVA_HOME /local/java/jdk1.7.0_79
abbr -a java6 set -gx JAVA_HOME /local/java/jdk1.6.0_31


#############
#  Aliases  #
#############

# Not all servers support rxvt-unicode-256color,
# use something safe instead
alias ssh="env TERM=xterm ssh"


###############
#  gpg-agent  #
###############

set -gx GPG_KEY 0E25CFCC
set -gx GPG_TTY (tty)

set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh

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

# Dotfiles

Hi! These are my dotfiles that I use every day. If you find something
interesting, go ahead and take whatever you want from my dotfiles.

I use Fedora, Arch and Gentoo linux for my workstations, and these files should
work just fine with those distributions. YMMV with other distributions or
operating systems.

It is managed using [yadm](https://github.com/TheLocehiliosan/yadm/), a dotfile
manager. This makes it simple to set up a new computer with these files. In
order to set up a new system with these dotfiles, do the following:

    yadm clone <repo URL>
    yadm decrypt
    vim/install.sh

# Requirements for install scripts

Requirements for pretty much everything

    git nodejs npm

The requirements i3 wm I use are

    i3 i3blocks xautolock i3lock feh playerctl sysstat compton scrot imagemagick

The requirements for vim is the following (Mostly because we need to compile
YCM)

    vim automake gcc gcc-c++ kernel-devel cmake python-devel
    python3-devel

Requirements for zsh

    zsh rubygems


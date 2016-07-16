# Dotfiles

Hi! These are my dotfiles that I use every day. If you find something
interesting, go ahead and take whatever you want from my dotfiles.

It is managed using [yadm](https://github.com/TheLocehiliosan/yadm/), a dotfile
manager. This makes it simple to set up a new computer with these files. In
order to set up a new system with these dotfiles, do the following:

    yadm clone <repo URL>
    yadm decrypt
    yadm perms

See subfolders for a short description of what the different programs are

# Quick setup for Fedora

    This is based on a minimal Fedora 24 install, from the netinstall image

    # dnf install --nogpgcheck \
    http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-24.noarch.rpm \
    http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-24.noarch.rpm

    # dnf copr enable thelocehiliosan/yadm
    # dnf copr enable nrechn/Sway
    # dnf copr enable dperson/neovim

    # dnf install pciutils wget tar telnet pcsc-lite owncloud-client @base-x \
    vim util-linux-user zsh dmenu rxvt-unicode-256color-ml firefox pulseaudio \
    openvpn maven subversion nginx dunst mercurial libnotify VirtualBox \
    bind-utils nmap vlc i3 pinentry-gtk ncurses-compat-libs msmtp lynx urlview \
    mutt vdirsyncer khal offlineimap htop jq fedora-icon-theme pass pcsc-tools \
    opensc bzip2 psmisc pulseaudio pulseaudio-module-x11 ntp \
    dejavu-sans-mono-fonts mesa-dri-drivers xorg-x11-server-Xwayland \
    yubikey-personalization-gui yadm sway automake gcc-c++ kernel-devel \
    cmake python-devel python3-devel neovim

    # Install oh-my-zsh https://github.com/robbyrussell/oh-my-zsh
    # Install nvm https://github.com/creationix/nvm
    # Install rustup.rs http://rustup.rs/

    $ nvm install node

    $ cd ~/.config/nvim && ./install.sh

    $ sudo pip install --update pip
    $ sudo pip install --update khard

Now set up vdirsyncer, and offlineimap with the provided systemd unit files,
after having created the required folders


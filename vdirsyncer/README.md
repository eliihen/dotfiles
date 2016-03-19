# vdirsyncer

## Where is the config??

Sorry, I encrypted the config :)

If you want to use it though, fill out a `config` according to the examples
the vdirsync people provide, they have pretty good documentation.

Read up on their configuration
[here](https://vdirsyncer.readthedocs.org/en/stable/tutorial.html#configuration)
and use that to fill in the example you download.

    wget https://raw.githubusercontent.com/pimutils/vdirsyncer/master/config.example
    vim config.example

## Setup

Basic setup goes like this

    pacaur -S khal     # or pip install khal if that does not work
    pacaur -S vdirsync # or pip install vdirsync if that does not work

    mkdir ~/.config/khal
    ln -s khal.conf ~/.config/khal/khal.conf

    mkdir ~/.vdirsyncer/
    ln -s vdirsyncer ~/.vdirsyncer/config
    ln -s getPass.sh ~/.vdirsyncer/getPass.sh

    mkdir -p ~/.calendars/{calendar,some-other-calendar-caldav-id}
    mkdir ~/.contacts/

    vdirsync sync

Then we need to set up a systemd timer for vdirsync.

    ~/.config/systemd/user/vdirsync.service
    ---

    [Unit]
    Description=Check DAV store for updates
    RefuseManualStart=no
    RefuseManualStop=yes

    [Service]
    Type=oneshot
    ExecStart=/usr/bin/vdirsyncer sync

Then create a user timer for that unit file that runs every 5 min

    ~/.config/systemd/user/vdirsync.timer
    ---

    [Unit]
    Description=Check DAV store for updates every 5 minutes
    RefuseManualStart=no
    RefuseManualStop=no

    [Timer]
    Persistent=false
    OnBootSec= 5min
    OnUnitActiveSec= 5min
    Unit=vdirsync.service

    [Install]
    WantedBy=default.target


#!/usr/bin/env bash

i3-msg "workspace 7 - Communication; append_layout /home/espen/workspace/espen/dotfiles/i3/scripts/pim.json"

# Launch programs with the correct titles to fill the swallows
$(urxvt -title "Mutt - espen_at_henriksen"           -e sh -c "mutt -f =espen_at_henriksen/INBOX; zsh") &
$(urxvt -title "Mutt - dev_at_henriksen"             -e sh -c "mutt -f =dev_at_henriksen/INBOX; zsh") &
$(urxvt -title "Mutt - espen_at_oslomarketsolutions" -e sh -c "mutt -f =espen_at_oslomarketsolutions/INBOX; zsh") &
$(urxvt -title "Mutt - espen_at_me"                  -e sh -c "mutt -f =espen_at_me/INBOX; zsh") &
$(urxvt -title "Khal"                                -e sh -c "khal interactive; zsh") &


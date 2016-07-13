#!/bin/bash
# Requires libnotify installed, as well as a notification
# server like dunst. For the icon you need an icon pack
# like 'fedora-icon-theme' or similar.
#
# See this URL for list of icons
# https://standards.freedesktop.org/icon-naming-spec/icon-naming-spec-latest.html

account=$1
notify-send 'New Mail' "A new E-Mail just ticked in to $account" --icon=mail-unread


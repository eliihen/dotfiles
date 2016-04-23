# Load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Set keyboard map
setxkbmap no

# Start pulseaudio daemon if not started
start-pulseaudio-x11 &

session=${1:-i3}

case $session in
  i3  ) exec i3;;
  kde ) exec startkde;;
  *   ) exec $;;
esac


[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap no

session=${1:-i3}

case $session in
  i3  ) exec i3;;
  kde ) exec startkde;;
  *   ) exec $;;
esac


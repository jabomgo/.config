#!/bin/bash
mkdir -p ~/Pictures/Screenshots

case "$1" in
  full)
    grim - | wl-copy
    grim ~/Pictures/Screenshots/"$(date +%Y-%m-%d_%H-%M-%S).png"
    ;;
  area)
    grim -g "$(slurp)" - | wl-copy
    grim -g "$(slurp)" ~/Pictures/Screenshots/"$(date +%Y-%m-%d_%H-%M-%S).png"
    ;;
  area-edit)
    grim -g "$(slurp)" - | swappy -f -
    ;;
esac

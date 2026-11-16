#!/bin/sh
WALLPAPER_DIR="$HOME/Imagens/Wallpapers"

if pgrep -x nsxiv > /dev/null; then
  pkill -x nsxiv
else
  nsxiv -t "$WALLPAPER_DIR"
fi

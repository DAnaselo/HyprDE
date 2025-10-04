#!/bin/bash

mkdir -p "$HOME/Nextcloud/Pictures/Screenshots" && \
filename="$HOME/Nextcloud/Pictures/Screenshots/$(date +'%s_grim.png')" && \
grim -l 0 -g "$(slurp -o)" "$filename" && \
wl-copy --type image/png < "$filename" && \
cliphist store | hyprctl notify 2 3000 1 " Image Saved to Clipboard"

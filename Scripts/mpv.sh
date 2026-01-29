#!/bin/bash

if [[ -z "$(wl-paste)" ]]; then
  hyprctl notify 4 3000 0 "No URL In Clipboard"
  exit 1
fi

url="$(wl-paste)"

hyprctl notify 1 6000 0 "Video starting..."

mpv --fs --hwdec=auto --ytdl-format="bestvideo[height<=?1080]+bestaudio/best" $url

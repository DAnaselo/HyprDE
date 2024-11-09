#!/bin/bash

# this Script Is Used To Watch Youtube Videos Without Ads And Hardware Accelertated Video Decoding Using MPV

# Check if a URL is pasted
if [[ -z "$(wl-paste)" ]]; then
  hyprctl notify 4 3000 0 "No URL In Clipboard"
  exit 1
fi

# Get the pasted URL
url="$(wl-paste)"

# Use a more descriptive notification message
hyprctl notify 1 6000 0 "Video starting..."

# Play the video using mpv with additional options
flatpak run io.mpv.Mpv --fs --hwdec=auto --ytdl-format="bestvideo[height<=?1080]+bestaudio/best" $url

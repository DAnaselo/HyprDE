#!/bin/bash
hyprctl notify 1 6000 0 " Wait The Video Will Start Shortly."
url="$(wl-paste)"
flatpak run io.mpv.Mpv --fs --hwdec=auto --ytdl-format="bestvideo[height<=?1080]+bestaudio/best" $url

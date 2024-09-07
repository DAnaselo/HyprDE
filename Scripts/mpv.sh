#!/bin/bash 
url="$(wl-paste)"
flatpak run io.mpv.Mpv --fs --ytdl-format="bestvideo[height<=?1080]+bestaudio/best" $url

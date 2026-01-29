#!/bin/bash

dir="$HOME/Scripts/undervolt"

chosen=$(ls "$dir"/*.py | xargs -n 1 basename | rofi -dmenu -p "Run script:")

if [ -n "$chosen" ]; then
    pkexec python3 "$dir/$chosen"
fi

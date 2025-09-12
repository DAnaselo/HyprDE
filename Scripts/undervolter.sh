#!/bin/bash

SCRIPT_DIR="$HOME/Scripts/undervolt"

# Pick script with rofi (runs fine on Wayland)
chosen=$(ls "$SCRIPT_DIR"/*.py | xargs -n 1 basename | rofi -dmenu -p "Run script:")

# Run chosen script with pkexec (GUI polkit password prompt works on Wayland)
if [ -n "$chosen" ]; then
    pkexec python3 "$SCRIPT_DIR/$chosen"
fi

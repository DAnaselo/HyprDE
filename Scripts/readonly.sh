#!/bin/bash

SAVE_FILE="/home/anas/.steam/steam/steamapps/compatdata/49520/pfx/drive_c/users/steamuser/Documents/My games/Borderlands 2/WillowGame/SaveData/76561199237456829/Save0001.sav"

# Rofi menu
CHOICE=$(printf "Enable Read-Only\nDisable Read-Only\nCancel" | rofi -dmenu -p "Borderlands 2 Save Control")

if [ "$CHOICE" = "Enable Read-Only" ]; then
    chmod 444 "$SAVE_FILE"
    if [ $? -eq 0 ]; then
        notify-send "Successfully Enabled Read-Only"
    else
        notify-send "Failed to enable Read-Only"
    fi

elif [ "$CHOICE" = "Disable Read-Only" ]; then
    chmod 644 "$SAVE_FILE"
    if [ $? -eq 0 ]; then
        notify-send "Successfully Disabled Read-Only"
    else
        notify-send "Failed to disable Read-Only"
    fi

else
    exit 0
fi

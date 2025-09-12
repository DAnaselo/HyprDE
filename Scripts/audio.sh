#!/bin/bash

# Function to set the default sink to the G435 headset
g435() {
  pactl set-default-sink alsa_output.usb-Jieli_Technology_G435_Wireless_Gaming_Headset_1120041405020407-00.analog-stereo && pactl set-default-source alsa_input.usb-Jieli_Technology_G435_Wireless_Gaming_Headset_1120041405020407-00.mono-fallback
}

# Function to set the default sink to the HDMI output
airpods() {
  pactl set-default-sink bluez_output.FC_A5_C8_BF_05_82.1 && pactl set-default-source bluez_input.FC:A5:C8:BF:05:82
}

# Function to prompt the user to choose a speaker
choose_speakers() {
  choice=$(printf "G435 Headset\nAirPods 4 with ANC" | rofi -dmenu -p "Choose output:")

  case "$choice" in
    "G435 Headset") g435;;
    "AirPods 4 with ANC") airpods;;
  esac
}

# Call the choose_speakers function
choose_speakers

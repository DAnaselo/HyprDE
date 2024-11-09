#!/bin/bash

# Function to set the default sink to the G435 headset
g435() {
  pactl set-default-sink alsa_output.usb-Jieli_Technology_G435_Wireless_Gaming_Headset_1120041405020407-00.analog-stereo
}

# Function to set the default sink to the HDMI output
hdmi() {
  pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo
}

# Function to prompt the user to choose a speaker
choose_speakers() {
  choice=$(printf "G435\nHDMI" | rofi -dmenu -p "Choose output:")

  case "$choice" in
    G435) g435;;
    HDMI) hdmi;;
  esac
}

# Call the choose_speakers function
choose_speakers

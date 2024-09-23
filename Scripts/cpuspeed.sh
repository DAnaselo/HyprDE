#!/bin/bash

# Check if cpupower is installed
if ! command -v cpupower &>/dev/null; then
  echo "cpupower is not installed. Please install it using 'sudo pacman -S cpupower'"
  exit 1
fi

# Get the desired maximum frequency from the user
read -p "Enter the desired maximum CPU frequency (e.g., 3200): " max_freq

# Validate input: ensure it's a number
if ! [[ "$max_freq" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a positive integer."
  exit 1
fi

# Set the maximum frequency using cpupower
sudo cpupower frequency-set -u "${max_freq}MHz"

# Verify the setting
echo "Maximum CPU frequency set to : "$max_freq"MHz"

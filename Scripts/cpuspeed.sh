#!/bin/bash

# This Script Sets a Clock Limit For Power Save Reasons

if ! command -v cpupower &>/dev/null; then
  echo "cpupower is not installed. Please install it using 'sudo pacman -S cpupower'"
  exit 1
fi

read -p "Enter the desired maximum CPU frequency (e.g., 3200): " max_freq

if ! [[ "$max_freq" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a positive integer."
  exit 1
fi

sudo cpupower frequency-set -u "${max_freq}MHz"

echo "Maximum CPU frequency set to : "$max_freq"MHz"

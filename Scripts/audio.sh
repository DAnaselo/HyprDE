#!/bin/bash

# Scan available output sinks and let user choose via rofi
choose_sink() {
  # Get available sinks with description and name
  mapfile -t sinks < <(pactl list short sinks | awk '{print $2}')
  choices=()
  for sink in "${sinks[@]}"; do
    desc=$(pactl list sinks | grep -A20 "Name: $sink" | grep "Description:" | head -n1 | cut -d' ' -f2-)
    [ -z "$desc" ] && desc="$sink"
    choices+=("$desc|$sink")
  done

  # Show choices in rofi, user picks by description
  choice=$(printf '%s\n' "${choices[@]}" | awk -F'|' '{print $1}' | rofi -dmenu -p "Choose audio output:")

  # Find selected sink's internal name
  sink_name=$(printf '%s\n' "${choices[@]}" | grep "^$choice|" | awk -F'|' '{print $2}')
  [ -n "$sink_name" ] && pactl set-default-sink "$sink_name"
}

# Scan available input sources and let user choose via rofi (optional)
choose_source() {
  # Get available sources (excluding monitor sources)
  mapfile -t sources < <(pactl list short sources | awk '{print $2}' | grep -v '.monitor')
  choices=()
  for source in "${sources[@]}"; do
    desc=$(pactl list sources | grep -A20 "Name: $source" | grep "Description:" | head -n1 | cut -d' ' -f2-)
    [ -z "$desc" ] && desc="$source"
    choices+=("$desc|$source")
  done

  # Show choices in rofi, user picks by description
  choice=$(printf '%s\n' "${choices[@]}" | awk -F'|' '{print $1}' | rofi -dmenu -p "Choose audio input:")

  # Find selected source's internal name
  source_name=$(printf '%s\n' "${choices[@]}" | grep "^$choice|" | awk -F'|' '{print $2}')
  [ -n "$source_name" ] && pactl set-default-source "$source_name"
}

# Choose sink and source interactively
choose_sink
choose_source

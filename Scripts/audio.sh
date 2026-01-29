#!/bin/bash

choose_sink() {
  mapfile -t sinks < <(pactl list short sinks | awk '{print $2}')
  choices=()
  for sink in "${sinks[@]}"; do
    desc=$(pactl list sinks | grep -A20 "Name: $sink" | grep "Description:" | head -n1 | cut -d' ' -f2-)
    [ -z "$desc" ] && desc="$sink"
    choices+=("$desc|$sink")
  done

  choice=$(printf '%s\n' "${choices[@]}" | awk -F'|' '{print $1}' | rofi -dmenu -p "Choose audio output:")

  sink_name=$(printf '%s\n' "${choices[@]}" | grep "^$choice|" | awk -F'|' '{print $2}')
  [ -n "$sink_name" ] && pactl set-default-sink "$sink_name"
}

choose_source() {
  mapfile -t sources < <(pactl list short sources | awk '{print $2}' | grep -v '.monitor')
  choices=()
  for source in "${sources[@]}"; do
    desc=$(pactl list sources | grep -A20 "Name: $source" | grep "Description:" | head -n1 | cut -d' ' -f2-)
    [ -z "$desc" ] && desc="$source"
    choices+=("$desc|$source")
  done

  choice=$(printf '%s\n' "${choices[@]}" | awk -F'|' '{print $1}' | rofi -dmenu -p "Choose audio input:")

  source_name=$(printf '%s\n' "${choices[@]}" | grep "^$choice|" | awk -F'|' '{print $2}')
  [ -n "$source_name" ] && pactl set-default-source "$source_name"
}

choose_sink
choose_source

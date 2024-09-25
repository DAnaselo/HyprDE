#!/bin/bash

# This Script Fixes The '0' Power Usage Bug Reported on intel Cpu's when trying to display their power Consumpotion in Mangohud

# Attempt to modify permissions
if ! sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj; then
  echo "Failed to modify permissions of '/sys/class/powercap/intel-rapl\:0/energy_uj'."
  exit 1
fi

# If execution reaches this point, the operation was successful
echo "Permissions of energy_uj modified successfully, Mangohud Can Now Read CPU Power Consumpotion."

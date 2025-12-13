#!/bin/bash

# This Script Fixes The '0' Power Usage Bug Reported on intel Cpu's when trying to display their power Consumpotion in Mangohud

# Attempt to modify permissions
ENERGY_UJ_PATH="/sys/class/powercap/intel-rapl:0/energy_uj"

if ! pkexec chmod o+r "$ENERGY_UJ_PATH"; then
  echo "Error: Unable to set read permissions for '$ENERGY_UJ_PATH'."
  exit 1
fi

# If execution reaches this point, the operation was successful
echo "Permissions of energy_uj modified successfully, Mangohud Can Now Read CPU Power Consumpotion."

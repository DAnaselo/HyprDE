#!/bin/bash

ENERGY_UJ_PATH="/sys/class/powercap/intel-rapl:0/energy_uj"

if ! pkexec chmod o+r "$ENERGY_UJ_PATH"; then
  echo "Error: Unable to set read permissions for '$ENERGY_UJ_PATH'."
  exit 1
fi

echo "Permissions of energy_uj modified successfully, Mangohud Can Now Read CPU Power Consumpotion."

#!/bin/bash
# This Fixes The "0" Power Reporting From Mangohud Due To Security Consernes
sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj

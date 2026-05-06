#!/bin/bash

TARGET_DIR="./scripts"
SCRIPT_PATTERN="*.sh"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo -e "=============================================================="
    echo "ERROR: The target directory was not found at: $TARGET_DIR"
    echo "Please modify the 'TARGET_DIR' variable to point to the correct location."
    echo "=============================================================="
    exit 1
fi

SCRIPTS=($(find "$TARGET_DIR" -maxdepth 1 -type f -executable -name "$SCRIPT_PATTERN" | sort))

if [ ${#SCRIPTS[@]} -eq 0 ]; then
    echo -e "============================================================"
    echo "WARNING: No executable scripts found in $TARGET_DIR matching $SCRIPT_PATTERN."
    echo "Please ensure your scripts are executable (chmod +x) and the path is correct."
    echo "============================================================"
    exit 0
fi
clear

echo -e "===================================================="
echo "                DaLauncher"
echo "===================================================="

for i in "${!SCRIPTS[@]}"; do
    printf "%s) %s\n" "$((i+1))" "$(basename "${SCRIPTS[$i]}")"
done

PS3='Enter selection number: '
# init an empty var
script_choice=""
read -r -p "Enter selection number: " input_number

# Validate the input number
if [[ "${input_number}" =~ ^[0-9]+$ ]]; then
    # Check if the number is within the valid range of the array indices
    # We subtract 1 because the user input (1-based) must match the array index (0-based)
    if (( input_number >= 1 && input_number <= ${#SCRIPTS[@]} )); then
        # Calculate the 0-based index
        index=$((input_number - 1))
        script_choice="${SCRIPTS[$index]}"
    else
        echo -e "\n[Error] Invalid selection number entered."
        script_choice="" # Clear choice if invalid
    fi
else
    echo -e "\n[Error] Invalid input. Must be a number."
    script_choice=""
fi

if [[ -n "$script_choice" ]]; then
    echo -e "\n[Info] Selected script path: $script_choice"
else
    echo -e "\n[Info] No valid selection made. Exiting launcher."
fi
    clear
    
    echo -e "===================================================="
    echo "              RUNNING: $(basename "$script_choice")"
    echo "===================================================="
    bash "$script_choice"
exit 0

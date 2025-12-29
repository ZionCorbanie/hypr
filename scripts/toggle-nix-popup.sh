#!/usr/bin/env bash

# Check if the nix-popup window is already running
if hyprctl clients | grep -q "class: nix-popup"; then
    # If it exists, just toggle the workspace view
    hyprctl dispatch togglespecialworkspace nix-popup
else
    # If it doesn't exist, launch it
    # (The window rule you already have will send it to the magic workspace)
    kitty --class nix-popup ~/.config/hypr/scripts/nix-selector.sh &
fi

#!/usr/bin/env bash

sleep 0.5

wallpaper="$HOME/Images/darkmogus.png"

monitors=$(hyprctl monitors -j | jq -r '.[].name')
for mon in $monitors; do
  awww img "$wallpaper" --outputs "$mon" --transition-type any --transition-duration 1
done


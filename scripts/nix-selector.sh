#!/usr/bin/env bash

TERMINAL_PID=$PPID
exit_script() {
    kill -9 $TERMINAL_PID
    exit 0
}

trap exit_script SIGINT

while true; do
    #clear
    read -p "Nix PKGs: " input

    if [ -z "$input" ]; then
        #exit_script
        clear
        exec zsh
        break
    fi

    read -ra pkgs <<< "$input"
    invalid_pkgs=()

    echo "Validating packages: ${pkgs[@]}"

    for pkg in "${pkgs[@]}"; do
        if ! nix-instantiate --eval -E "with import <nixpkgs> {}; $pkg" >/dev/null 2>&1; then
            invalid_pkgs+=("$pkg")
        fi
    done

    if [ ${#invalid_pkgs[@]} -ne 0 ]; then
        echo "---------------------------------------"
        echo "Error: The following packages do not exist:"
        for p in "${invalid_pkgs[@]}"; do
            echo "  - $p"
        done
        echo "---------------------------------------"
        #read -n 1
        continue
    fi
    echo "Entering nix-shell"
    nix-shell -p "${pkgs[@]}" --run "exec zsh"
    exit_script
done

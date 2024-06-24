#!/bin/bash

function ask_yes_or_no() {
    read -p "$1 ([y]es or [N]o): "
    case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
        y|yes) echo "yes" ;;
        *)     echo "no" ;;
    esac
}


if [[ "no" == $(ask_yes_or_no "Are you sure?") || \
      "no" == $(ask_yes_or_no "Are you *really* sure?") ]]
then
    echo "Skipped."
    exit 0
fi

echo "Removing nvim related config files"

rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/.local/share/nvim"

# optional directory for work related nvim config
rm -rf "$HOME/.config/work-nvim-overlay"

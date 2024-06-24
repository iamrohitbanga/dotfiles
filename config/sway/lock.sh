#!/bin/bash

set -e

config="$HOME/.config/sway"
wallpapers="$config/wallpapers"
file=lockscreen-wallpaper.png

swaylock --clock --datestr '%Y-%m-%d' --indicator \
    --daemonize \
    --font-size 80 \
    --indicator-radius 250 \
    --ignore-empty-password \
    --show-failed-attempts \
    --image "$wallpapers/$file"

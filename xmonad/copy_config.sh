#!/bin/bash

cp xmonad.hs ~/.xmonad/xmonad.hs
cp xmobarrc ~/.xmobarrc
mkdir -p ~/.config/polybar/scripts
cp polybar/config ~/.config/polybar/config
cp polybar/launch.sh ~/.config/polybar/launch.sh
cp polybar/scripts/* ~/.config/polybar/scripts/

#!/bin/bash

CONFIG_DIR="$HOME/.config"
BASH_CONFIG_DIR="$CONFIG_DIR/bash"

mkdir -p $BASH_CONFIG_DIR

cp base_bashrc $BASH_CONFIG_DIR/base_bashrc

# careful we are overwriting the system bashrc here
cp std_bashrc ~/.bashrc


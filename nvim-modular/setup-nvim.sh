#!/bin/bash

CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$CONFIG_DIR/nvim-backup"
NVIM_DIR="$CONFIG_DIR/nvim"


rm -rf $BACKUP_DIR

mv $NVIM_DIR $BACKUP_DIR

mkdir $NVIM_DIR

cp init.lua $NVIM_DIR
cp -r lua $NVIM_DIR

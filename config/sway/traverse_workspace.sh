#!/bin/bash
# taken from https://www.reddit.com/r/swaywm/comments/mmfwnu/sway_command_workspace_next/
# Move to next workspace whether or not it has windows.

CUR_WORKSPACE=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused)' | jq -r '.current_workspace')

if [[ $1 == "prev" ]]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE - 1)
elif [[ $1 == "next" ]]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE + 1)
fi

# do not cycle around
if [[ $TO_WORKSPACE -eq 13 ]]; then
    TO_WORKSPACE=12
elif [[ $TO_WORKSPACE -eq 0 ]]; then
    TO_WORKSPACE=1
fi

swaymsg workspace number $TO_WORKSPACE

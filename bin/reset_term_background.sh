#!/bin/bash

set -e

TERM_BACKGROUND="$HOME/.term_background"

if [ -f $TERM_BACKGROUND ]; then
    BACKGROUND_CONTENTS=$(cat $TERM_BACKGROUND)
    COMMAND="$HOME/.config/base16-shell/scripts/$BACKGROUND_CONTENTS.sh"
    source $COMMAND

cat << EOF > "$HOME/.vimrc_background"
if !exists('g:colors_name') || g:colors_name != '$BACKGROUND_CONTENTS'
  colorscheme $BACKGROUND_CONTENTS
endif
EOF

fi

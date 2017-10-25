#!/bin/bash

# curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

for rc_file in vim/.vimrc bash/.bashrc tmux/.tmux.conf zsh/* .profile; do
  dotfile=${rc_file##*/} # get the part after the last slash
  [ -e ~/$dotfile ] && \
    mv ~/$dotfile ~/$dotfile.backup.`date +%F`.$RANDOM

  ln -s $PWD/$rc_file ~/$dotfile && echo "success: $PWD/$rc_file -> ~/$dotfile"

done


#!/usr/bin/sh
gitdotfiles=$(pwd)
ln -vs $gitdotfiles/!(README.md|symlink.sh|.git) /home/$USER/.config/

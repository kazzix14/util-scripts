#!/bin/sh

# exec
# rofi -show run -run-list-command . path/to/list-additional-commands-for-rofi.sh -run-command /bin/bash -i -c -l {cmd} -rnow
# to startup rofi

aliases=`alias | awk -F'[ =]' '{print $2}'`
snap_bins=`ls ~/snap`

echo "\
$aliases
$snap_bins
" | sed '$d;N; /^\(.*\)\n\1$/!P; D'

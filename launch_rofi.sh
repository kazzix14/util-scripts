#!/bin/bash

options=(
	-run-list-command	". $HOME/bin/rofi/list-additional-commands-for-rofi.sh"
	-run-command		"/bin/bash -i -c -l '{cmd}'"
	-modi			"run,drun,window,calc:qalc,vpn:$HOME/bin/rofi/vpn.sh"
	-show			"run"
	-rnow
	-sidebar-mode

	# key bindings
	-kb-cancel		"Super+d,Super+Escape,Escape,Control+c"
	-kb-mode-next		"Super+l"
	-kb-mode-previous 	"Super+h"
	-kb-row-up 		"Super+k"
	-kb-row-down 		"Super+j"
)

setxkbmap en
rofi "$@"  "${options[@]}"

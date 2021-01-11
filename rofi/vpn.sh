#!/usr/bin/env bash

set -euCo pipefail

dir="$HOME/.config/openvpn"

function main() {
	key_list=`ls $dir`

	cmd_list=`echo "$key_list" | awk "{ print \"$dir/\" \\$0; }"`
	cmd_list=`echo "$cmd_list" | awk "{ print \\$0 \" -name '*.ovpn'\"; }"`
	cmd_list=`echo "$cmd_list" | xargs -L1 find`

	local -r IFS=$'\n'
	key_list=(`echo "$key_list"`)
	cmd_list=(`echo "$cmd_list"`)

	local -A menu

	for i in ${!key_list[@]}
	do
		menu[${key_list[$i]}]=${cmd_list[$i]}
	done

	if [ $# -ne 0 ]; then
		sudo /usr/sbin/openvpn ${menu[$1]} > /dev/null 2>&1 &
	else
		echo "${!menu[*]}"
	fi
}

main $@

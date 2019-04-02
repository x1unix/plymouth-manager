#!/bin/bash

set -e
C_NC='\033[0m'
C_GREEN='\033[0;32m'
C_RED="\033[0;31m"
PLYM_DIR="/usr/share/plymouth/themes"

function p_main {
	cmd=$1
	case $cmd in
	"list")
		p_list
		;;
	"install")
		p_install $2
		;;
	"select")
		p_select
		;;
	"preview")
		p_preview
		;;
	*)
		p_help
		;;
	esac
}

function p_help {
	printf "Plymouth theme manager\n"
	printf "Usage: ${0} [COMMAND] args..\n\n"
	echo "Available commands: install, list, select, preview"
	exit 0
}

function p_list {
	themes=$(ls "${PLYM_DIR}")
	current_theme=$(readlink /etc/alternatives/default.plymouth)
	echo "List of Plymouth themes:"
	for i in $themes; do
		# Skip files
		if [ ! -d $PLYM_DIR/$i ]; then
		      continue
	      	fi

		# Highlight current theme
		if [[ "$current_theme" == *"$PLYM_DIR/$i"* ]]; then
			printf "${C_GREEN} - $i (current)${C_NC}\n"
		else
			echo " - $i"
		fi
	done
}

function p_install {
	local theme_name="$1"
	if [ -z "${theme_name}" ]; then
		echo "please specify theme name"
		exit 1
	fi

	local thm_dir="${PLYM_DIR}/${theme_name}/${theme_name}.plymouth"
	if [ ! -f $thm_dir ]; then
		throw "Theme '$theme_name' not found ($thm_dir)\n"
		p_list
		exit 1
	fi

	sudo update-alternatives --install ${PLYM_DIR}/default.plymouth default.plymouth $thm_dir 100
}

function p_select {
	sudo update-alternatives --config default.plymouth
	sudo update-initramfs -u
}

function p_preview {
	if [ ! $( id -u ) -eq 0 ]; then
		echo "Must be run as root"
		exit 1
	fi

	duration=$1
	if [ $# -ne 1 ]; then
		DURATION=5
	fi

	plymouthd; plymouth --show-splash ; for ((I=0; I<$DURATION; I++)); do plymouth --update=test$I ; sleep 1; done; plymouth quit
}

function throw {
	printf "${C_RED}ERROR:${C_NC} $1\n"
}

p_main $@

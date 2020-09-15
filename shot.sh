#!/bin/bash 

##this app was developed by tenner and can be downloaded in its original at http://tenr.de/snippets/scripts/shot.sh
##it has been modified here for use with MX Fluxbox

DESTDIR="${HOME}/Pictures"
#DESTDIR="${HOME}/bib/realprojekt"
NAME="`date +%y%m%d_%M%S_`\$wx\$h"
SUF="png"
PRE=""
OPTION="-q 100"

display_help() {
	cat << EOF
	Usage: `basename "$0"` [-r/r/-w/w/-b/b] [-png|png|-jpg|jpg] 
EOF
}

take_shot() {
	scrot ${OPTION} "${PRE}${NAME}.${SUF}" -e 'mv $f '$DESTDIR' && nomacs '$DESTDIR'/$f'
}

if [ $# -gt 2 ]
then
	display_help
	exit 1
elif [ $# -eq 0 ]
then
	take_shot
	exit 0
else
	case "$1" in
		-r|r|-R|-r|root|Root|-root|-Root)
			OPTION=""
			;;		
		-w|w|-W|-W|window|Window|-window|-Window)
			OPTION="-s"
			#PRE="part_"
			;;
		-b|b|-B|-B|border|Border)
			OPTION="-sb"
			#PRE="part_"
			;;		
		*)
			display_help
			exit 1
	esac

	case "$2" in
		jpg|JPG|-jpg|-JPG)
			SUF="jpg"
			;;	
		png|PNG|-png|-PNG)
			SUF="png"
			;;
		*)
			display_help
			exit 1
	esac
	take_shot
	exit 0
fi
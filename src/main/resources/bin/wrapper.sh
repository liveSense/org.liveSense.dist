#!/bin/bash
# -----------------------------------------------------------------------------
# execute a YAJSW command
#
# -----------------------------------------------------------------------------
# Formatting constants
RESET=`echo -e "\033[0m"`
BOLD_ON=`echo -e "\033[1m"`
UNDERLINE_ON=`echo -e "\033[4m"`
FAINT_ON=`echo -e "\033[2m"`
ITALIC_ON=`echo -e "\033[3m"`
BLINK_ON=`echo -e "\033[5m"`
NEGATIVE_ON=`echo -e "\033[7m"`
CONCEAL_ON=`echo -e "\033[8m"`
OVERLINED_ON=`echo -e "\033[53m"`
BACKGROUND_OFF=`echo -e "\033[49m"`
NEGATIVE_OFF=`echo -e "\033[27m"`
Black=`echo -e "\033[30m"`
BACKGROUND_OFF=`echo -e "\033[40m"`
DarkGrey=`echo -e "\033[1;30m"`
DarkGreyBG=`echo -e "\033[1;40m"`
LightGrey=`echo -e "\033[37m"`
LightGreyBG=`echo -e "\033[47m"`
White=`echo -e "\033[1;37m"`
WhiteBG=`echo -e "\033[1;47m"`
Red=`echo -e "\033[31m"`
RedBG=`echo -e "\033[41m"`
LightRed=`echo -e "\033[1;31m"`
LightRedBG=`echo -e "\033[1;41m"`
Green=`echo -e "\033[32m"`
GreenBG=`echo -e "\033[42m"`
LightGreen=`echo -e "\033[1;32m"`
LightGreenBG=`echo -e "\033[1;42m"`
Brown=`echo -e "\033[33m"`
BrownBG=`echo -e "\033[43m"`
Yellow=`echo -e "\033[1;33m"`
YellowBG=`echo -e "\033[1;43m"`
Blue=`echo -e "\033[34m"`
BlueBG=`echo -e "\033[44m"`
LightBlue=`echo -e "\033[1;34m"`
LightBlueBG=`echo -e "\033[1;44m"`
Purple=`echo -e "\033[35m"`
PurpleBG=`echo -e "\033[45m"`
Pink=`echo -e "\033[1;35m"`
PinkBG=`echo -e "\033[1;45m"`
Cyan=`echo -e "\033[36m"`
CyanBG=`echo -e "\033[46m"`
LightCyan=`echo -e "\033[1;36m"`
LightCyanBG=`echo -e "\033[1;46m"`

"$java_exe" "$wrapper_java_options" "$wrapper_java_sys_options" -jar "$wrapper_jar" "$@"  | sed  \
-e "s/^.*|.*|.*|.*|\(.*\)/\1/g" \
-e "/^Trigger found:\(.*\)/d" \
-e "/^start script\(.*\)/d" \
-e "/^end script\(.*\)/d" \
-e "s/^\(.\{24\}\)\(INFO..\)\(.*\)/\2\3/g" \
-e "s/^\(.\{24\}\)\(DEBUG.\)\(.*\)/\2\3/g" \
-e "s/^\(.\{24\}\)\(WARN..\)\(.*\)/\2\3/g" \
-e "s/^\(.\{24\}\)\(TRACE.\)\(.*\)/\2\3/g" \
-e "s/^\(.\{24\}\)\(ERROR.\)\(.*\)/\2\3/g" \
-e "s/^.\{13\}\(\[.*\]\)\(.*\) \(INFO..\)\(.*\)/\3\4/g" \
-e "s/^.\{13\}\(\[.*\]\)\(.*\) \(DEBUG.\)\(.*\)/\3\4/g" \
-e "s/^.\{13\}\(\[.*\]\)\(.*\) \(WARN..\)\(.*\)/\3\4/g" \
-e "s/^.\{13\}\(\[.*\]\)\(.*\) \(TRACE.\)\(.*\)/\3\4/g" \
-e "s/^.\{13\}\(\[.*\]\)\(.*\) \(ERROR.\)\(.*\)/\3\4/g" \
-e "s/^\(INFO  \)\(.*\)\(.\-.BundleEvent.\)\(.*\)/${RESET}${LightCyan}\2${LightGray}\3${RedBG}${Yellow}\4${RESET}/g" \
-e "s/^\(INFO  \)\(.*\)\( \- Service \)\(\[.*\]\) \([a-zA-Z0-9]*\) \([a-zA-Z0-9]*\)/${RESET}${LightCyan}\2${LightGray}\3${Yellow}\4 ${White}\5 ${RedBG}${Yellow}\6${RESET}/g" \
-e "s/^\(INFO  \)\(GWTREQUESTFACTORY.-.>>>*\)/${RESET}${Pink}\2${RESET}/g" \
-e "s/^\(INFO  \)\(GWTREQUESTFACTORY.-.<<<*\)/${RESET}${LightCyan}\2${RESET}/g" \
-e "s/^\(INFO  \)\(logs\/access.log*\)/${RESET}${LightGreen}\2${RESET}/g" \
-e "s/^\(INFO  \)\(logs\/request.log*\)/${RESET}${Green}\2${RESET}/g" \
-e "s/^\(ERROR \)\(.*\)/${UNDERLINE_ON}${LightRed}\2${RESET}/g" \
-e "s/^\(	at.*\)/${LightRed}\1${RESET}/g" \
-e "s/^\(Caused by:\)\(.*\)/${White}\1${LightRed}\2${RESET}/g" \
-e "s/^\(WARN  \)\(.*\)/${RESET}${Yellow}\2${RESET}/g" \
-e "s/^\(INFO  \)\(.*\)/${RESET}${White}\2${RESET}/g" \
-e "s/^\(DEBUG \)\(.*\)/${RESET}${LightBlue}\2${RESET}/g" \
-e "s/^\(TRACE \)\(.*\)/${RESET}${Brown}\2${RESET}/g" \
-e "s/^\(.*\)/${LightGray}${RESET}\1/g"

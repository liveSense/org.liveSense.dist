echo %java_exe% %wrapper_java_options% -jar %wrapper_jar% %1 %2 %3 %4 %5 %6 %7 %8 %9
%java_exe% %wrapper_java_options% -jar %wrapper_jar% %1 %2 %3 %4 %5 %6 %7 %8 %9 | bin\sed -e "s/^.*|.*|.*|.*|\(.*\)/\1/g " ^
-e "/^Trigger found:\(.*\)/d" ^
-e "/^start script\(.*\)/d" ^
-e "/^end script\(.*\)/d" ^
-e "s/^\(.\{24\}\)\(INFO..\)\(.*\)/\2\3/g" ^
-e "s/^\(.\{24\}\)\(DEBUG.\)\(.*\)/\2\3/g" ^
-e "s/^\(.\{24\}\)\(WARN..\)\(.*\)/\2\3/g" ^
-e "s/^\(.\{24\}\)\(TRACE.\)\(.*\)/\2\3/g" ^
-e "s/^\(.\{24\}\)\(ERROR.\)\(.*\)/\2\3/g" ^
-e "s/^.\{13\}\(\[.*\]\)\(.*\) \(INFO..\)\(.*\)/\3\4/g" ^
-e "s/^.\{13\}\(\[.*\]\)\(.*\) \(DEBUG.\)\(.*\)/\3\4/g" ^
-e "s/^.\{13\}\(\[.*\]\)\(.*\) \(WARN..\)\(.*\)/\3\4/g" ^
-e "s/^.\{13\}\(\[.*\]\)\(.*\) \(TRACE.\)\(.*\)/\3\4/g" ^
-e "s/^.\{13\}\(\[.*\]\)\(.*\) \(ERROR.\)\(.*\)/\3\4/g" ^
-e "s/^\(INFO  \)\(.*\)\(.\-.BundleEvent.\)\(.*\)/[0m[1;36m\2[37m\3[41m[1;33m\4[0m/g" ^
-e "s/^\(INFO  \)\(.*\)\( \- Service \)\(\[.*\]\) \([a-zA-Z0-9]*\) \([a-zA-Z0-9]*\)/[0m[1;36m\2[37m\3[1;33m\4 [1;37m\5 [41m[1;33m\6[0m/g" ^
-e "s/^\(INFO  \)\(GWTREQUESTFACTORY.-.>>>*\)/[0m[1;35m\2[0m/g" ^
-e "s/^\(INFO  \)\(GWTREQUESTFACTORY.-.<<<*\)/[0m[1;36m\2[0m/g" ^
-e "s/^\(INFO  \)\(logs\/access.log*\)/[0m[1;35m\2[0m/g" ^
-e "s/^\(INFO  \)\(logs\/request.log*\)/[0m[32m\2[0m/g" ^
-e "s/^\(ERROR \)\(.*\)/[4m[1;31m\2[0m/g" ^
-e "s/^\(	at.*\)/[1;31m\1[0m/g" ^
-e "s/^\(Caused by:\)\(.*\)/[1;37m\1[1;31m\2[0m/g" ^
-e "s/^\(WARN  \)\(.*\)/[0m[1;33m\2[0m/g" ^
-e "s/^\(INFO  \)\(.*\)/[0m[1;37m\2[0m/g" ^
-e "s/^\(DEBUG \)\(.*\)/[0m[1;34m\2[0m/g" ^
-e "s/^\(TRACE \)\(.*\)/[0m[33m\2[0m/g" ^
-e "s/^\(.*\)/[37m[0m\1/g"

rem RESET=`echo -e "[0m"`
rem BOLD_ON=`echo -e "[1m"`
rem UNDERLINE_ON=`echo -e "[4m"`
rem FAINT_ON=`echo -e "[2m"`
rem ITALIC_ON=`echo -e "[3m"`
rem BLINK_ON=`echo -e "[5m"`
rem NEGATIVE_ON=`echo -e "[7m"`
rem CONCEAL_ON=`echo -e "[8m"`
rem OVERLINED_ON=`echo -e "[53m"`
rem BACKGROUND_OFF=`echo -e "[49m"`
rem NEGATIVE_OFF=`echo -e "[27m"`
rem Black=`echo -e "[30m"`
rem BACKGROUND_OFF=`echo -e "[40m"`
rem DarkGrey=`echo -e "[1;30m"`
rem DarkGreyBG=`echo -e "[1;40m"`
rem LightGrey=`echo -e "[37m"`
rem LightGreyBG=`echo -e "[47m"`
rem White=`echo -e "[1;37m"`
rem WhiteBG=`echo -e "[1;47m"`
rem Red=`echo -e "[31m"`
rem RedBG=`echo -e "[41m"`
rem LightRed=`echo -e "[1;31m"`
rem LightRedBG=`echo -e "[1;41m"`
rem Green=`echo -e "[32m"`
rem GreenBG=`echo -e "[42m"`
rem LightGreen=`echo -e "[1;32m"`
rem LightGreenBG=`echo -e "[1;42m"`
rem Brown=`echo -e "[33m"`
rem BrownBG=`echo -e "[43m"`
rem Yellow=`echo -e "[1;33m"`
rem YellowBG=`echo -e "[1;43m"`
rem Blue=`echo -e "[34m"`
rem BlueBG=`echo -e "[44m"`
rem LightBlue=`echo -e "[1;34m"`
rem LightBlueBG=`echo -e "[1;44m"`
rem Purple=`echo -e "[35m"`
rem PurpleBG=`echo -e "[45m"`
rem Pink=`echo -e "[1;35m"`
rem PinkBG=`echo -e "[1;45m"`
rem Cyan=`echo -e "[36m"`
rem CyanBG=`echo -e "[46m"`
rem LightCyan=`echo -e "[1;36m"`
rem LightCyanBG=`echo -e "[1;46m"`

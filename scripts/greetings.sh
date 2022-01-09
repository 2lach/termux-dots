RANDOM_NR=$((1 + RANDOM % 10))
uptime=$(which uptime)
fortune=$(which fortune)

case "$RANDOM_NR" in
"1")
	FIG_FONT=standard
	;;
"2" | "3")
	FIG_FONT=slant
	;;
"4" | "5")
	FIG_FONT=mini
	;;
"6" | "7")
	FIG_FONT=small
	;;
"8" | "9")
	FIG_FONT=big
	;;
*)
	FIG_FONT=smslant
	;;
esac

if (($RANDOM_NR < 3)); then
	figlet -w $(tput cols) -c -f $FIG_FONT "SwL" | lolcat
elif (($RANDOM_NR > 3 && $RANDOM_NR < 9)); then
	$uptime | lolcat -3
else
	$fortune
fi

echo ''

COLUMNS=$(tput cols)
title=$(date +'%x %T')

printf "%*s\n" $(((${#title} + $COLUMNS) / 2)) "$title" | lolcat

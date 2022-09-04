COLUMNS=$(tput cols)
title=$(date +'%x %T')
printf "%*s\n" $(((${#title} + $COLUMNS) / 2)) "$title" | lolcat

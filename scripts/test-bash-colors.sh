#!/data/data/com.termux/files/usr/bin/bash

echo "# Ansi color code variables"
red="\e[0;91m"
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

echo "# horizontally expanded backgrounds"
echo -e "${blue_bg}${reset}"
echo -e "${red_bg}${reset}"
echo -e "${green_bg}${reset}"

echo ""

echo "# colored text"
echo -e "${red}Hello World!${reset}"
echo -e "${blue}Hello World!${reset}"
echo -e "${green}Hello World!${reset}"
echo -e "${white}Hello World!${reset}"

echo ""

echo "# bold colored text"
echo -e "${red}${bold}Hello World!${reset}"
echo -e "${blue}${bold}Hello World!${reset}"
echo -e "${green}${bold}Hello World!${reset}"
echo -e "${white}${bold}Hello World!${reset}"

echo ""

echo "# underlined colored text"
echo -e "${red}${uline}Hello World!${reset}"
echo -e "${blue}${uline}Hello World!${reset}"
echo -e "${green}${uline}Hello World!${reset}"
echo -e "${white}${uline}Hello World!${reset}"

echo ""

echo "# ansi across multiple lines"
echo -e "${green}This is a sentence across"
echo "three lines to show how an ansi color"
echo -e "works across multiple lines with echo.${reset}"

echo ""

echo "# combining ansi in one line"	
echo -e "${red}This sentence ${green}displays ${blue}ansi code used in ${white}${bold}combination.${reset}"

# Regular Colors
function show(){
declare -a BASH_COLORS=(
"| Value    | Color  |"
"| -------- | ------ |"
"| \e[0;30m | Black  |"
"| \e[0;31m | Red    |"
"| \e[0;32m | Green  |"
"| \e[0;33m | Yellow |"
"| \e[0;34m | Blue   |"
"| \e[0;35m | Purple |"
"| \e[0;36m | Cyan   |"
"| \e[0;37m | White  |"
"# Bold"
"| Value    | Color    |"
"| -------- | -------- |"
"| \e[1;30m | Black    |"
"| \e[1;31m | Red      |"
"| \e[1;32m | Green    |"
"| \e[1;33m | Yellow   |"
"| \e[1;34m | Blue     |"
"| \e[1;35m | Purple   |"
"| \e[1;36m | Cyan     |"
"| \e[1;37m | White    |"
"| \e[1m    | No Color |"
"# Underline"
"| Value    | Color    |"
"| -------- | -------- |"
"| \e[4;30m | Black    |"
"| \e[4;31m | Red      |"
"| \e[4;32m | Green    |"
"| \e[4;33m | Yellow   |"
"| \e[4;34m | Blue     |"
"| \e[4;35m | Purple   |"
"| \e[4;36m | Cyan     |"
"| \e[4;37m | White    |"
"| \e[4m    | No Color |"
"# Background"
"| Value  | Color  |"
"| ------ | ------ |"
"| \e[40m | Black  |"
"| \e[41m | Red    |"
"| \e[42m | Green  |"
"| \e[43m | Yellow |"
"| \e[44m | Blue   |"
"| \e[45m | Purple |"
"| \e[46m | Cyan   |"
"| \e[47m | White  |"
"# Expand Background Horizontally"
"| Value |   Color  |"
"| ----- | -------- |"
"| \e[K  | No Color |"
"# High Intensty"
"| Value    | Color  |"
"| -------- | ------ |"
"| \e[0;90m | Black  |"
"| \e[0;91m | Red    |"
"| \e[0;92m | Green  |"
"| \e[0;93m | Yellow |"
"| \e[0;94m | Blue   |"
"| \e[0;95m | Purple |"
"| \e[0;96m | Cyan   |"
"| \e[0;97m | White  |"
"# Bold High Intensty"
"| Value    | Color  |"
"| -------- | ------ |"
"| \e[1;90m | Black  |"
"| \e[1;91m | Red    |"
"| \e[1;92m | Green  |"
"| \e[1;93m | Yellow |"
"| \e[1;94m | Blue   |"
"| \e[1;95m | Purple |"
"| \e[1;96m | Cyan   |"
"| \e[1;97m | White  |"
"# High Intensty backgrounds"
"| Value     | Color  |"
"| --------- | ------ |"
"| \e[0;100m | Black  |"
"| \e[0;101m | Red    |"
"| \e[0;102m | Green  |"
"| \e[0;103m | Yellow |"
"| \e[0;104m | Blue   |"
"| \e[0;105m | Purple |"
"| \e[0;106m | Cyan   |"
"| \e[0;107m | White  |"
"# Reset"
"| Value | Color  |"
"| ----- | ------ |"
"| \e[0m | Reset  |"
)
for i in "${BASH_COLORS[@]}"
do
   echo -e "\e[0m $i \e[0m"
done
}

show
#- Answer from https://stackoverflow.com/questions/27239183/how-to-center-script-output-in-the-middle-of-the-screen
# If you are referring to the center of the terminal window, get the columns and rows of the terminal window with:

COLS=$(tput cols)
ROWS=$(tput lines)
CLOCKWIDTH=8 #I'm assuming a HH:MM:SS format
CENTERCOL=$((COLS / 2))
CENTERCOL=$((CENTERCOL - CLOCKWIDTH))
CENTERROW=$((ROWS / 2))

# And then use the tput command to set the cursor position with:

tput cup $CENTERCOL $CENTERROW

## See http://www.cyberciti.biz/tips/spice-up-your-unix-linux-shell-scripts.html for an example using tput and https://www.gnu.org/software/termutils/manual/termutils-2.0/html_chapter/tput_1.html for more information about the tput command.

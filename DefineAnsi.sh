# Regular Colors
COLOR_BLACK="\e[30m"
COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_YELLOW="\e[33m"
COLOR_BLUE="\e[34m"
COLOR_MAGENTA="\e[35m"
COLOR_CYAN="\e[36m"
COLOR_WHITE="\e[37m"

# Bold
COLOR_BOLD_BLACK="\e[1;30m"
COLOR_BOLD_RED="\e[1;31m"
COLOR_BOLD_GREEN="\e[1;32m"
COLOR_BOLD_YELLOW="\e[1;33m"
COLOR_BOLD_BLUE="\e[1;34m"
COLOR_BOLD_MAGENTA="\e[1;35m"
COLOR_BOLD_CYAN="\e[1;36m"
COLOR_BOLD_WHITE="\e[1;37m"

# Underline
COLOR_UNDERLINE_BLACK="\e[4;30m"
COLOR_UNDERLINE_RED="\e[4;31m"
COLOR_UNDERLINE_GREEN="\e[4;32m"
COLOR_UNDERLINE_YELLOW="\e[4;33m"
COLOR_UNDERLINE_BLUE="\e[4;34m"
COLOR_UNDERLINE_MAGENTA="\e[4;35m"
COLOR_UNDERLINE_CYAN="\e[4;36m"
COLOR_UNDERLINE_WHITE="\e[4;37m"

# Background
COLOR_BACKGROUND_BLACK="\e[40m"
COLOR_BACKGROUND_RED="\e[41m"
COLOR_BACKGROUND_GREEN="\e[42m"
COLOR_BACKGROUND_YELLOW="\e[43m"
COLOR_BACKGROUND_BLUE="\e[44m"
COLOR_BACKGROUND_MAGENTA="\e[45m"
COLOR_BACKGROUND_CYAN="\e[46m"
COLOR_BACKGROUND_WHITE="\e[47m"

# High Intensity
COLOR_HIGH_INTENSITY_BLACK="\e[0;90m"
COLOR_HIGH_INTENSITY_RED="\e[0;91m"
COLOR_HIGH_INTENSITY_GREEN="\e[0;92m"
COLOR_HIGH_INTENSITY_YELLOW="\e[0;93m"
COLOR_HIGH_INTENSITY_BLUE="\e[0;94m"
COLOR_HIGH_INTENSITY_MAGENTA="\e[0;95m"
COLOR_HIGH_INTENSITY_CYAN="\e[0;96m"
COLOR_HIGH_INTENSITY_WHITE="\e[0;97m"

# Bold High Intensity
COLOR_BOLD_HIGH_INTENSITY_BLACK="\e[1;90m"
COLOR_BOLD_HIGH_INTENSITY_RED="\e[1;91m"
COLOR_BOLD_HIGH_INTENSITY_GREEN="\e[1;92m"
COLOR_BOLD_HIGH_INTENSITY_YELLOW="\e[1;93m"
COLOR_BOLD_HIGH_INTENSITY_BLUE="\e[1;94m"
COLOR_BOLD_HIGH_INTENSITY_MAGENTA="\e[1;95m"
COLOR_BOLD_HIGH_INTENSITY_CYAN="\e[1;96m"
COLOR_BOLD_HIGH_INTENSITY_WHITE="\e[1;97m"

# Reset
COLOR_RESET="\e[0m"




If you put these in your .bashrc, you can: 
echo -e "${COLOR_RED}This is red text.${COLOR_RESET}"
echo -e "${COLOR_BOLD_GREEN}This is bold green text.${COLOR_RESET}"


-------- 2NDARY METHOD -------------

# Define ANSI color codes for text colors
BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"

# Define ANSI color codes for bright text colors
BRIGHT_BLACK="\033[1;30m"
BRIGHT_RED="\033[1;31m"
BRIGHT_GREEN="\033[1;32m"
BRIGHT_YELLOW="\033[1;33m"
BRIGHT_BLUE="\033[1;34m"
BRIGHT_MAGENTA="\033[1;35m"
BRIGHT_CYAN="\033[1;36m"
BRIGHT_WHITE="\033[1;37m"

# Define ANSI color codes for background colors
BG_BLACK="\033[0;40m"
BG_RED="\033[0;41m"
BG_GREEN="\033[0;42m"
BG_YELLOW="\033[0;43m"
BG_BLUE="\033[0;44m"
BG_MAGENTA="\033[0;45m"
BG_CYAN="\033[0;46m"
BG_WHITE="\033[0;47m"

# Define ANSI color codes for bright background colors
BG_BRIGHT_BLACK="\033[1;40m"
BG_BRIGHT_RED="\033[1;41m"
BG_BRIGHT_GREEN="\033[1;42m"
BG_BRIGHT_YELLOW="\033[1;43m"
BG_BRIGHT_BLUE="\033[1;44m"
BG_BRIGHT_MAGENTA="\033[1;45m"
BG_BRIGHT_CYAN="\033[1;46m"
BG_BRIGHT_WHITE="\033[1;47m"

# Reset ANSI color code
RESET="\033[0m"

# Print color samples
echo -e "${BLACK}Black Text${RESET} ${BG_BLACK}Black Background${RESET}"
echo -e "${RED}Red Text${RESET} ${BG_RED}Red Background${RESET}"
echo -e "${GREEN}Green Text${RESET} ${BG_GREEN}Green Background${RESET}"
echo -e "${YELLOW}Yellow Text${RESET} ${BG_YELLOW}Yellow Background${RESET}"
echo -e "${BLUE}Blue Text${RESET} ${BG_BLUE}Blue Background${RESET}"
echo -e "${MAGENTA}Magenta Text${RESET} ${BG_MAGENTA}Magenta Background${RESET}"
echo -e "${CYAN}Cyan Text${RESET} ${BG_CYAN}Cyan Background${RESET}"
echo -e "${WHITE}White Text${RESET} ${BG_WHITE}White Background${RESET}"

# Print bright color samples
echo -e "${BRIGHT_BLACK}Bright Black Text${RESET} ${BG_BRIGHT_BLACK}Bright Black Background${RESET}"
echo -e "${BRIGHT_RED}Bright Red Text${RESET} ${BG_BRIGHT_RED}Bright Red Background${RESET}"
echo -e "${BRIGHT_GREEN}Bright Green Text${RESET} ${BG_BRIGHT_GREEN}Bright Green Background${RESET}"
echo -e "${BRIGHT_YELLOW}Bright Yellow Text${RESET} ${BG_BRIGHT_YELLOW}Bright Yellow Background${RESET}"
echo -e "${BRIGHT_BLUE}Bright Blue Text${RESET} ${BG_BRIGHT_BLUE}Bright Blue Background${RESET}"
echo -e "${BRIGHT_MAGENTA}Bright Magenta Text${RESET} ${BG_BRIGHT_MAGENTA}Bright Magenta Background${RESET}"
echo -e "${BRIGHT_CYAN}Bright Cyan Text${RESET} ${BG_BRIGHT_CYAN}Bright Cyan Background${RESET}"
echo -e "${BRIGHT_WHITE}Bright White Text${RESET} ${BG_BRIGHT_WHITE}Bright White Background${RESET}"


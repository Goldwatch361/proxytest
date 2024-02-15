#!/bin/bash
##################################
#Proxy Full Install Script by TRAP
##################################
#colors
purp=`tput setaf 5`
reset=`tput sgr0`
clear >$(tty)
echo
echo
echo "${purp}Proxy Script by TRAP${reset}"
echo
echo
##################################
echo "1. Enter Telegram API Key :"
read telapikey
clear >$(tty)
echo
echo
echo "${purp}Proxy Script by TRAP${reset}"
echo
echo
##################################
echo "2. Enter Telegram Chat ID :"
read telchatid
clear >$(tty)
echo
echo
echo "${purp}Proxy Script by TRAP${reset}"
echo
echo
##################################
echo "Your Telegram API Key is : ${purp}$telapikey ${reset}"
echo "Your Telegram Chat ID is : ${purp}$telchatid ${reset}"
echo
echo
echo "Is that correct ?"
echo "press(Y/N) to continue."
echo

# Wait for the user to press a key
read -s -n 1 key

# Check which key was pressed
case $key in
    y|Y)
        echo "You pressed 'y'. Continuing..."

echo "$telapikey" > /scripts/telapikey.txt
echo "$telchatid" > /scripts/telchatid.txt

        ;;
    n|N)
        echo "You pressed 'n'. Exiting..."
        exit 1
        ;;
    *)
        echo "Invalid input. Please press 'y' or 'n'."
        ;;
esac

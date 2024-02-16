#!/bin/bash
##################################
#Proxy Full Install Script by TRAP
##################################
#colors
purp=`tput setaf 5`
red=`tput setaf 1`
reset=`tput sgr0`
clear >$(tty)

######################################################################################################
######################################################################################################

kopf() {
clear >$(tty)
echo
echo
echo "${purp}Proxy Script by TRAP${reset}"
echo
echo
}

######################################################################################################
######################################################################################################

main() {

kopf

echo "1. Enter Telegram API Key :"
echo
read telapikey

kopf

echo "2. Enter Telegram Chat ID :"
echo
read telchatid

kopf

echo "IP Address for incoming Source."
echo "Enter 0.0.0.0/0 to get Proxy Access from everywhere."
echo
echo "${red}! Not recommend to set 0.0.0.0/0 !${reset}"
echo "${red}! ProxyScraper get this Proxy soon or later !${reset}"
echo
echo "3. Enter Authenticate IP :"
echo
read authip

kopf

echo "Your Telegram API Key is : ${purp}$telapikey ${reset}"
echo "Your Telegram Chat ID is : ${purp}$telchatid ${reset}"
echo "Your Trusted IP is :       ${purp}$authip ${reset}"
echo

ask

}

######################################################################################################
######################################################################################################

saveset(){

echo "$telapikey" > telapikey.txt
echo "$telchatid" > telchatid.txt
echo "$authip" > authip.txt
mv telapikey.txt scripts
mv telchatid.txt scripts
mv authip.txt scripts

}

######################################################################################################
######################################################################################################

ask(){
echo
echo "Information correct?"
echo
echo "y = yes"
echo "n = no"
echo "e = exit"

while true; do
read -rsn1 input

if [ "$input" = "y" ]; then
    saveset
    kopf
    loading 60 "Setup Proxy..."

elif [ "$input" = "n" ]; then
    main

elif [ "$input" = "e" ]; then
    exit
    
fi

done
}

######################################################################################################
######################################################################################################

loading() {
    local load_interval="${1}"
    local loading_message="${2}"
    local elapsed=0
    local loading_animation=( '—' "\\" '|' '/' )

    echo -n "${loading_message} "

    # This part is to make the cursor not blink
    # on top of the animation while it lasts
    tput civis
    trap "tput cnorm" EXIT
    while [ "${load_interval}" -ne "${elapsed}" ]; do
        for frame in "${loading_animation[@]}" ; do
            printf "%s\b" "${frame}"
            sleep 0.1
        done
        elapsed=$(( elapsed + 1 ))
    done
    printf " \b\n"

    echo 
    echo "Setup Complete!"
    echo
    exit
}

######################################################################################################
######################################################################################################

# SCRIPT

######################################################################################################
######################################################################################################

kopf
main

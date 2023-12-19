#!/bin/bash

##############################################################################
# Colors
green='\e[32m'
blue='\e[34m'
clear='\e[0m'
red='\033[0;31m'
nc='\033[0m'
##############################################################################

function color_green() {
    echo -ne $green$1$clear
}
function color_blue() {
    echo -ne $blue$1$clear
}

function config () {
    editor="nano"

    echo -ne "
    Menu
    $(color_green '1)') ~./bashrc
    $(color_green '2)') /etc/fstab
    $(color_green '3)') /etc/apt/sources.list
    $(color_green '4)') crontab
    $(color_green '5)') crontab root
    $(color_green '0)') Exit
    $(color_blue 'Choose an option:') "
        
        read A
            
        case $A in
        1) 
        sudo $editor ~/.bashrc ;;
        
	2) 
	sudo $editor /etc/fstab ;;

        3) 
	sudo $editor /etc/apt/sources.list ;;

        4) 
	EDITOR=$editor crontab -e ;;

        5) 
	EDITOR=$editor crontab -u root -e ;;
	     
        0) 
        exit 0 ;;
        
        *) 
        echo -e "${red}Wrong option${nc}" ;;
    esac
}

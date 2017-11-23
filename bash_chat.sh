#!/bin/bash
###############################################################################
## BASHCHAT                                                                  ##
## chat room program for use over a lan using shared folders.                ##
## by hexxend  9/12/2015                                                     ##
###############################################################################
#
# TODOS
# Pick a location for files a stick to it.(current paths are just for testing)
# Complete check for terminal type.
# 
#
#GLOBALS
user=$USER
date=$(date +%m/%e/%y_%-T)


clear

## Check what terminal we're using
##if [ -z $COLORTERM ]; then
##        xterm -e ./read.sh && 
##elif [ $COLORTERM == xfce4-terminal ]; then
$COLORTERM --execute ./read.sh &&    
##fi

echo "$user has busted into the room:$date" >> chat

# The main function
function main {
  sleep 1
  #read -n2 &&

  echo -n "message: "
  read msg && clear
    
  if [ $msg == "//exit" ]; then
    echo "$user has left the room:$date" >> chat && sleep 2; echo 'goodbye!'
    exit 0
  elif [ $msg == "//help" ]; then
    echo -e "BashChat help\n//cowsay    send a cowsay message to the room\n//help    display this text\n//exit    exit bash chat" 
    echo -n "Press any key..."
    read
  elif [ $msg == "//clear" ]; then 
    echo > chat
  elif [ -z $msg ]; then 
     main
  elif [ $msg == "//cowsay" ]; then
     echo -n "cowsay> "
     read cow
     cowsay $cow >> chat 
  else
     echo $user":$msg":$date >> chat

  fi
    
}

# ----Main Loop----
echo "BashChat" | toilet -f smslant | lolcat -a -s 100
echo "                     v0.01a-9.12.2015"
# ----Main Loop----
while :
do
    echo "enter //help for a list of commands"
    main
done

exit 0

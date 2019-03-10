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
#Copyright (C) 2019  HexXend
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License along
#    with this program; if not, write to the Free Software Foundation, Inc.,
#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
#hexxend@protonmail.com

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

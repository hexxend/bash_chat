#!/bin/bash
# bashchat in one termianl
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

function main {
    cat chat
}

while :
do
    clear
    main
    echo -n "> "
    read msg

    if [ -z $msg ]; then 
        echo "Enter a message"
    elif [ $msg == "//msg" ]; then
        ./bash_chat.sh
    elif [ $msg == "//update" ]; then
        sleep 1
    elif [ $msg == "//clear" ]; then
        echo > chat
    else 

        echo $USER $(date +%m/%e/%y_%-T):$msg >> chat
    fi
done


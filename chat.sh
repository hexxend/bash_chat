#!/bin/bash
# bashchat in one termianl
# hexxend
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


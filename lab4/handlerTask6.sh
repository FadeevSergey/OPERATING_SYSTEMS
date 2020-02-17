#!/bin/bash

echo $$ > .pid

number=0
MODE="work"

handler()
{
	MODE="stop"
}

trap 'handler' SIGTERM

while true
do
    case $MODE in
        "work")
            let count=$count+1
            echo $count
            ;;
        "stop")
            echo "Stopped by SIGTERM"
            rm .pid
            exit
            ;;
    esac
    sleep 1
done

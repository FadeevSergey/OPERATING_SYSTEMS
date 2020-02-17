#!/bin/bash

echo $$ > .pid

number=0
MODE=""

stop()
{
	MODE="stop"
}

trap 'stop' SIGTERM

usr1()
{
	MODE="plus"
}

trap 'usr1' USR1

usr2()
{
	MODE="multiply"
}

trap 'usr2' USR2

while true
do
    case $MODE in
        "plus")
            let count=$count+2
            echo $count
            MODE=""
            ;;
	"multiply")
            let count=$count*2
            echo $count
	    MODE=""
            ;;
        "stop")
            echo "Stopped by SIGTERM"
            rm .pid
            exit
            ;;
    esac
    sleep 1
done

#! /bin/bash

#if [[ "$1" -gt "$2" ]]; then
#    tempMax="$1"
#else
#    tempMax="$2"
#fi
#
#if [[ "$tempMax" -gt "$3" ]]; then 
#    echo "$tempMax"
#else
#    echo "$3"
#fi

if [[ $# -ne 3 ]]; then
    echo "not 3 variables passed"
    exit 0
fi

if [[ "$1" -gt "$2" ]]; then
    if [[ "$1" -gt "$3" ]]; then 
	echo "$1"
    else
	echo "$3"
    fi
else
    if [[ "$2" -gt "$3" ]]; then 
        echo "$2"
    else
        echo "$3"
    fi
fi

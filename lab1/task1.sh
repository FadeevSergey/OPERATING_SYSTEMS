#! /bin/bash

#read firstString
#read secondString
#if [[ "$firstString" == "$secondString" ]] then
#    echo "strings are equals"
#else
#    echo "strings are not equals"
#fi

if [[ $# -ne 2 ]]; then
    echo "not 2 variables passed"
    exit 0
fi

if [[ "$1" == "$2" ]]; then
    echo "strings are equal"
else
    echo "strings are not equals"
fi


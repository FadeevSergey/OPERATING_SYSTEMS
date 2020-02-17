#! /bin/bash

echo "Open nano  | enter: nano "
echo "Open vi    | enter: vi   "
echo "Open links | enter: links"
echo "Close menu | enter: close"

read comand

case $comand in
nano )
    nano
    ;;
vi )
    vi
    ;;
links )
    links
    ;;
close )
    exit 0
    ;;
esac

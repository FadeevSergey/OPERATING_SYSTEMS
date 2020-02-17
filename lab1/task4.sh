#! /bin/bash

read tempNumber
while [[ $((tempNumber % 2)) != 0 ]]; do
    ((cur++))
    read tempNumber
done

echo "$cur"

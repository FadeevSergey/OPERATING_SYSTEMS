#!/bin/bash

number="1"
operand="+"

generatorPID=$(head -n 1 "dataTask5.txt")

(tail -n 0 -f "dataTask5.txt") |
while true
do
	read tempString
	if [[ $tempString == "QUIT" ]]; then
		echo "Planned stop"
		
		break
	fi

	if [[ $tempString == "+" || $tempString == "*" ]]; then
		operand=$tempString
		continue
	fi

	if [[ $tempString =~ ^-?[0-9]+$ ]]; then
		number=$(echo "scale=10; ($number)$operand($tempString)" | bc)
		echo $number
		continue
	else
		echo "Unplanned stop"
		break
	fi
	sleep 1
done

kill $generatorPID
killall tail

rm dataTask5.txt

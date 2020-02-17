#!/bin/bash
outputFile="outTaskFour.txt"

resultString=""

for PID in $(ps a | awk '{print $1}' | grep [[:digit:]]); do
	if [ -f /proc/$PID/statm ]; then
		tempDiff="$(awk '{print $2 - $3}' /proc/$PID/statm)"
		if [ -n "$tempDiff" ]; then
			resultString="$resultString$tempDiff $PID\n"
		fi
	fi
done

printf "$resultString" | sort -rn | awk '{print $2 ":" $1}' > $outputFile


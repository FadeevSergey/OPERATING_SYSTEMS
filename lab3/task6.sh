#!/bin/bash

inputFile="outTaskFive.txt"
outputFile="outTaskSix.txt"

rm $outputFile

prevPPid="0"
curNum="0"
curSumSleepAVG="0"

while read newLine; do

	tempPPid=$(echo $newLine | awk -F '=' '{ print $3 }' | awk '{ print $1 }')
	tempSleepAVG=$(echo $newLine | awk -F '=' '{ print $4 }')
	if [ $prevPPid == $tempPPid ]; then
		let curNum=curNum\+1
		curSumSleepAVG=$(echo "scale=10; $curSumSleepAVG+$tempSleepAVG" | bc)
	else
		resultAvarageSleepAVG=$(echo "scale=10; $curSumSleepAVG/$curNum" | bc)
		printf "Average_Sleeping_Children_of_ParentID=$tempPPid is $resultAvarageSleepAVG\n" >> $outputFile
		prevPPid=$tempPPid
		curNum="1"
		curSumSleepAVG=$tempSleepAVG
	fi
	printf "$newLine\n" >> $outputFile

done < $inputFile

resultAvarageSleepAVG=$(echo "scale=10; $curSumSleepAVG/$curNum" | bc)
printf "Average_Sleeping_Children_of_ParentID=$tempPPid is $resultAvarageSleepAVG\n" >> $outputFile

#!/bin/bash

outputFile="outTaskFive.txt"
resultString=""

for PID in $(ps a x -o pid | tail +2); do

#Find PID

	resultPID=$(grep -s "^Pid:" /proc/$PID/status | awk '{print $2}')

#Find PPID

	resultPPID=$(grep -s "^PPid:" /proc/$PID/status | awk '{print $2}')

#Find SleepAVG

	tempSum="$(grep -s "sum_exec_runtime" /proc/$PID/sched | awk '{print $3}')"
 	tempSwitches="$(grep -s "nr_switches" /proc/$PID/sched | awk '{print $3}')"
	if [ -z $tempSum ] | [ -z $tempSwitches ]; then
		continue
	fi

	SleepAVG=$(echo "scale=10; $tempSum/$tempSwitches" | bc)
	
#
 	resultString="$resultString$resultPID $resultPPID $SleepAVG\n"	
done

	printf "$resultString" | sort -n --key=2 | awk '{print "ProcessID=" $1 " : " "Parent_ProcessID=" $2 " : " "Avarage_Sleeping_Time=" $3 }' > $outputFile

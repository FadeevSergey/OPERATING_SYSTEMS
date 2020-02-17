#!/bin/bash

cycle="cycleForTask4.sh"

./$cycle &
firstPID=$!
./$cycle &
secondPID=$!

sleep 1
echo " before renice"
echo " PID  %CPU"
ps ax -o pid,pcpu | grep " $firstPID\| $secondPID"
renice +19 $firstPID
sleep 1
echo " after renice"
echo " PID  %CPU"
ps ax -o pid,pcpu | grep " $firstPID\| $secondPID"

kill $firstPID
kill $secondPID


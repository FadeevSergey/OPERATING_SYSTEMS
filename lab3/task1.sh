#!/bin/bash

outputFile="outTaskOne.txt"
user="sergey"

ps -u sergey | wc -l | awk '{print $1}' > $outputFile
ps -u $user | awk '{print $1 ":" $4}' >> $outputFile

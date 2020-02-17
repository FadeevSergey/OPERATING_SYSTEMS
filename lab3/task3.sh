#!/bin/bash

outputFile="outTaskThree.txt"

ps a x | grep /sbin/ | awk '{print $1}' > $outputFile

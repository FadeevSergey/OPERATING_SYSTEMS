#!/bin/bash

fileCron="tempFileForCron"
crontab -l > $fileCron
echo "*/5 * * * * /home/sergey/lab4/task1.sh" >> $fileCron
crontab $fileCron
rm $fileCron

#check crontab.guru

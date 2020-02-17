#!/bin/bash

lastBackup=$(ls -1 ~| grep "Backup-....-..-.." | sort | tail -1)

file=$(ls -1 ~/$lastBackup)

DATE_OF_LAST_BACKUP=$(echo "$lastBackup" | awk -F '-' '{print $2 "-" $3 "-" $4}')

if [[ ! -d ~/restore ]]; then
	mkdir -p ~/restore
fi 

while read FILE; do
	len=${#FILE}
	if [[ len -gt 11 ]]; then
		suf=${FILE:$((len-10))}
		if [ "$suf" != "$DATE_OF_LAST_BACKUP" ]; then
			cp ~/$lastBackup/$FILE ~/restore
			echo "copy ~/$lastBackup/$FILE"
		fi
	else
		cp ~/$lastBackup/$FILE ~/restore
		echo "copy ~/$lastBackup/$FILE"
	fi
done <<<"$file"

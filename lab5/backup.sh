#!/bin/bash

#thank you kol9

TODAY=$(date +%F)
WEEK_AGO="Backup-$(date --date="-7 day" +%F)"

check=$(ls -1 ~| grep "Backup-....-..-..")

flag="NO"
LAST=""
if [ "$check" != "" ]
then
	while read LINE; do
		if [ "$flag" == "NO" ] && [ "$LINE" < "$WEEK_AGO" ]
		then
			flag="YES"
			LAST="$LINE"
		fi
	done<<<"$check"
fi

if [ "$flag" == "NO" ]
then
	BACKUP="Backup-"$(date +%F)
	mkdir ~/$BACKUP
	echo "created ~/$BACKUP"
	cp -r ~/source/* ~/$BACKUP
	echo "copy ~/source"

	echo -e "\n\nCREATED NEW $BACKUP" >>~/backup-report
	echo "print in ~/backup-report CREATED NEW $BACKUP"
	ls -1 ~/$BACKUP >>~/backup-report
	
	exit 0
fi

echo -e "\n\nCHANGE $LAST in $TODAY" >>~/backup-report
echo "print in ~/backup-report CHANGE $LAST in $TODAY"

files_source=$(ls -1 ~/source)
new_files=""
exists_files=""

while read FILE; do

	check_exist=$(cat ~/$LAST/$FILE 2>&1 >/dev/null)

	if [ "$check_exist" == "" ]
	then
		size_in_source=$(stat -c %s ~/source/$FILE)
		size_in_last=$(stat -c %s ~/$LAST/$FILE)

		if [ "$size_in_last" != "$size_in_source" ]
		then
			exists_files="$exists_files\n$FILE $FILE.$TODAY"
			mv ~/$LAST/$FILE ~/$LAST/$FILE.$TODAY
			echo "mv ~/$LAST/$FILE ~/$LAST/$FILE.$TODAY"
			cp -r ~/source/$FILE ~/$LAST
			echo "cp -r ~/source/$FILE ~/$LAST" 
		fi
	else
		new_files="$new_files\n$FILE"
		cp -r ~/source/$FILE ~/$LAST
		echo "cp -r ~/source/$FILE ~/$LAST" 
	fi

done <<<"$files_source"

echo -e "$new_files\n$exists_files" >>~/backup-report
echo "print in ~/backup-report $new_files\n$exists_files" 

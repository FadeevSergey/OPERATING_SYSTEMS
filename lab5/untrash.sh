#!/bin/bash
hideDirectory="$HOME/.trash"
logFile="$HOME/.trash.log"

file=$1

grep $file $logFile |
while read newLine; do
	tempPath=$(echo $newLine | awk '{ print $1 }')
	tempFile=$(echo $newLine | awk '{ print $2 }')

	echo "Would you like restore $tempFile? Path: $tempPath"
	echo "~~~~~~~~~~~~~~Enter yes(y) or no(n)~~~~~~~~~~~~~~"

	read com </dev/tty 
	echo "command read"
	if [[ "$com" == "y" ]]; then
		tempDirectory=$(dirname $tempPath)
		if [[ -d $tempDirectory ]]; then 
			ln $hideDirectory/$tempFile $tempPath
			echo "cread link $hideDirectory/$tempFile $tempPath"
		else
			ln $hideDirestory/$tempFile ~/$file
			echo "cread link $hideDirectory/$tempFile ~/$file"
			echo "File was restore at home directory"
		fi 
		rm "$hideDirectory/$tempFile"
		echo "delete $hideDirectory/$tempFile"
	fi
done


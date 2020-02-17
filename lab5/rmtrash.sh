#!/bin/bash

hideDiretory="$HOME/.trash"
logFile="$HOME/.trash.log"

#a.
file=$1
#b.
if [[ ! -d $hideDiretory ]]; then
	mkdir ~/.trash
	echo "created ~/.trash"
fi
#c.
fileWithNumber="curNumber"

if [[ ! -f $fileWithNumber ]];  then
	touch $fileWithNumber
	echo "created $fileWithNumber"
	printf "0" > $fileWithNumber
fi

number=$(head -n1 $fileWithNumber)
let number=number\+1

ln $file $hideDiretory/$number.lnk
echo "created link $file $hideDiretory/$number.lnk"
rm $file
echo "delete $file"

echo $number > $fileWithNumber
echo "print new number in fileWithNumber"
#d.
echo "$PWD/$file $number.lnk" >> $logFile
echo "print $PWD/$file $number.lnk in $logFile" 

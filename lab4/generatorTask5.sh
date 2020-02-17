#!/bin/bash

echo $$ > dataTask5.txt

while true
do
	read tempString
	echo "$tempString" >> dataTask5.txt

done

#! /bin/bash

resultString=""
read tempString
while [[ "$tempString" != "q" ]]; do
    resultString="$resultString$tempString"
    read tempString
done

echo "$resultString"

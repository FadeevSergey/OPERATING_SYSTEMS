#!/bin/bash

read file
tempString=""

tempString=$(grep -E "(^#![[:alnum:]]*)|(^[^#].*)" $file)

printf "$tempString" > $file

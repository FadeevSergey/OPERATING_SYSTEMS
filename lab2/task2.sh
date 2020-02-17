#!/bin/bash

inputFile="/var/log/Xorg.0.log"
outputFile="full.log"

sudo grep -E "\] \(WW\)" $inputFile | sed "s/(WW)/Warning:/g" > $outputFile
sudo grep -E "\] \(II\)" $inputFile | sed "s/(II)/Information:/g" >> $outputFile

cat $outputFile

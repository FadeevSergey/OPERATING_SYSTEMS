#!/bin/bash

#1

mkdir ~/test && 
{ 
	echo "catalog test was created successfully" >> ~/report;
	touch ~/test/$(date +%F_%R);
}

#2

ping "www.net_nikogo.ru" || echo "Error www.net_nikogo.ru" >> ~/report

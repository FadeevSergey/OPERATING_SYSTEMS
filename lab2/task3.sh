#!/bin/bash

sudo grep -rsohE "[A-Za-z0-9\-\.\_\/]+@[A-Za-z0-9\-\.\_\/]+\.[a-z]" /etc | uniq -u | tr "\n" ","  > "emails.lst"



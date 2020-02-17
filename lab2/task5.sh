#!/bin/bash

sudo awk -F: '{print $3" "$1}' /etc/passwd | sort -n| awk '{print $2" "$1}'

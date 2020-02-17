#!/bin/bash

sudo wc -l $(sudo find /var/log -name '*.log') | awk '{print $1}'

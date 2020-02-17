#! /bin/bash
grep -so -H -E "^#!/bin/[[:alnum:]]+" /bin/* | sort | uniq -c | sort -nr | head -1 | awk '{print $2}'
#!
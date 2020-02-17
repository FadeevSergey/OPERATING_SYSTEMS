#!/bin/bash

man bash | tr -c "[:alnum:]" "\n" | grep -E ".{4,}" | sort | uniq -c | sort -nr | head -3 | awk '{print $2}'

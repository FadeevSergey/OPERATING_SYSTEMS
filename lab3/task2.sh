#!/bin/bash

ps -u | tail -n 1 | awk '{print $2}'


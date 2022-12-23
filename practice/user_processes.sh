#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

read -p "Would you like to sort the processes output by memory or CPU? (m/c): " sort_by
read -p "How many procceses you would like it to display? Leave empty for all: " proc_count

if [ "$proc_count" == "" ]; then
	proc_count=100
fi

if [ "$sort_by" == "m" ]; then
  ps aux --sort -rss | grep -i `whoami` | head -n "$proc_count"
elif [ "$sort_by" == "c" ]; then
  ps aux --sort -pcpu | grep -i `whoami` | head -n "$proc_count"
else
  echo -e "${RED}No input provided. Showing unsorted list${NC}"
  ps aux | grep -i `whoami` | head -"$proc_count"
fi

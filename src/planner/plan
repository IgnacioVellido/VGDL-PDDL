#!/bin/bash

# Set virtual memory limit to 1G
#ulimit -v 1000000

# Set virtual memory limit to 15m
ulimit -t 900

# Remove auxiliary files
rm -f log plan

# Temporary output file
tmp="${3}_tmp"

# Call planner
#timeout 10 "$(dirname "$0")"/siw-then-bfsf --domain $1 --problem $2 --output $3
"$(dirname "$0")"/MpC -Q -o $3 -P 1 $1 $2 > log 2>&1

# Format output
awk '{print toupper(substr($0, index($0,$3)))}' $3 > $tmp
mv $tmp $3
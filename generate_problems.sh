#!/bin/bash

case $1 in
  -h)
    echo "Usage: ./generate_problems.sh LOWER_BOUND UPPER_BOUND GAME_IDX CONFIG_PATH OUTPUT_PATH"
    echo ""
    echo \
"Generate problem files starting from level LOWER_BOUND up to level UPPER_BOUND
for game GAME_IDX. To translate the levels, use the configuration specified in
CONFIG_PATH and write the output problem to OUTPUT_PATH."
    exit 0
esac

for (( i=$1; i<=$2; i++ )); do
  echo "Generating problem for level $i"
  timeout 1 java -jar target/GVGAI-PDDL-1.0.jar -g $3 -l $i -c $4 --localhost 2> /dev/null
  mv problem.pddl $5/problem-lvl${i}.pddl 
done

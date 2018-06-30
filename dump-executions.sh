#!/bin/sh -
set -e

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Pass state machine arn as first argument"
    exit 1
fi
NEEDED_COMMANDS="aws jq"
for cmd in ${NEEDED_COMMANDS} ; do
  # echo "CHECK $cmd..."
  if ! command -v ${cmd} &> /dev/null ; then
    echo "Please install ** ${cmd} ** and try again!"
    exit 1
  fi
done

ARN=$1

aws stepfunctions list-executions --state-machine-arn $ARN

# Iterating through executions @TBD
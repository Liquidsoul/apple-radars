#!/usr/bin/env bash

result=0
for dir in $(echo ./*/)
do
  printf "%s: " "$dir"
  make -C "$dir" 2>/dev/null;
  command_result=$?
  if [ $command_result -ne 0 ]; then
    result=$command_result
  fi
done

exit $result

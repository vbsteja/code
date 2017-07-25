#!/bin/bash
#"$@" #lsit all command line arguments
pid=$!
while read line ; do
  cmd=" "
  for var in "$@"
  do
    #echo $var
    cmd="$cmd $var"
  done
  echo $cmd
  #$cmd
done

kill -KILL $pid

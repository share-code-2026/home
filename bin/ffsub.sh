#!/usr/bin/bash
fn=$1
if [[ "${fn}" != *.* ]]; then
  echo "args: file_name start_time"
  echo "args: file_name start_time end_time"
  exit
fi
st=$2
et=$3

# head
fn2="${fn%.*}_ss${st//:/_}"
cmd="$ffmpeg -hide_banner -n -ss $st"
# middle
if [ -n "$et" ]; then
  fn2="${fn2}to${et//:/_}"
  cmd="$cmd -to $et"
fi
# tail
fn2="$fn2.${fn##*.}"
cmd="$cmd -i $fn -c copy $fn2"

#echo $cmd
$cmd

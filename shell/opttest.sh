#!/bin/sh

echo "ARG@: $@"
echo "ARG*: $*"

TTT=`getopt -q -o +  --long "user:,key:,pass:" -- "$@"`

eval set -- "$TTT"

tmp_found=1
for i; do
  echo "Proc0: $i/$tmp_found"
  if [ $tmp_found -eq 0 ] ; then 
   echo "Found: $i"
   MHOST="$i"
   break
  fi
  if [ "$i" = "--" ]; then tmp_found=0; fi
done

#set -- $TTT
eval set -- $TTT

for i; do
  echo "Proc: $i"
  case "$i" in
    --user  ) USER2="$2"
          shift 0;;
    --key  ) KEY="$2"
          shift 0 ;;
    --pass  ) PASS="$2"
          shift 0;;
    --  ) shift 0; break ;;
  esac
done

echo "ARG: $@"
echo "Getopt: $TTT"
echo "Res: host:$MHOST, use:$USER2, k:$KEY, p:$PASS"

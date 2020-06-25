#!/bin/sh


while :
do
  echo "[$(date +"%d/%m/%Y %H:%M:%S") | DEBUG] Check hosts from allow.lst to be available"
  for l in $(cat allow.lst)
  do
    echo foo | ncat $(echo $l | tr ":" " ") > /dev/null 2>&1
    if [[ $? != 0 ]]
    then
      echo "[$(date +"%d/%m/%Y %H:%M:%S") | ERROR] $l is not accessible, but should be !!"
      exit 1
    else
      echo "[$(date +"%d/%m/%Y %H:%M:%S") | INFO] $l is accessible"
    fi
  done
  echo "[$(date +"%d/%m/%Y %H:%M:%S") | DEBUG] Check hosts from deny.lst to be not available"
  for l in $(cat deny.lst)
  do
    echo foo | ncat $(echo $l | tr ":" " ") > /dev/null 2>&1
    if [[ $? != 0 ]]
    then
      echo "[$(date +"%d/%m/%Y %H:%M:%S") | INFO] $l not accessible"
    else
      echo "[$(date +"%d/%m/%Y %H:%M:%S") | ERROR] $l is accessible, but should not be !!"
      exit 1
    fi
  done
  if [ ! -z "$REPEAT_AFTER" ]
  then
    echo "[$(date +"%d/%m/%Y %H:%M:%S") | DEBUG] wait $REPEAT_AFTER seconds and repeat"
    sleep $REPEAT_AFTER
  else
    break
  fi
done



exit 0

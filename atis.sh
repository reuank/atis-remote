#!/bin/bash

atis(){
  hostname="atis"
  remotePath="Schreibtisch"
  printer="pool-sw3"
  mode="two-sided-long-edge" # Standard Duplex

  # Check if file specified
  if [ -z "${1}" ]
  then
    echo "=> No file name specified. Aborting." 1>&2
    return 1
  fi

  # Check if correct printer specified
  if [ -n "${2}" ]
  then
    case $2 in
      pool-sw1|pool-sw2|pool-sw3|pool-farb1) 
        printer=$2;;
      sw1|sw2|sw3|farb1) 
        printer=pool-$2;;
      *) 
        echo "=> Invalid printer. Printing on default printer '$printer'" 1>&2;;
    esac
  fi

  # Check if print mode is specified
  if [ -n "${3}" ]
  then
    case $3 in
      one-sided|two-sided-long-edge|two-sided-short-edge) 
        mode=$3;;
      duplex) 
        ;; # already default
      simplex)
        mode=one-sided;;
      *) 
        echo "=> Invalid print mode. Printing with default print mode '$mode'" 1>&2;;
    esac
  fi

  # Move file to atis account
  scp "$1" $hostname:$remotePath

  # Print file on printer pool-sw3
  filename=$( basename "$1" )
  
  if ssh $hostname "lpr -P $printer -o sides=$mode $remotePath/$filename"
  then
    echo "=> Printed file '$filename' successfully on printer '$printer' with print mode '$mode'."
  else
    echo "=> Printing failed." 1>&2
    return 1
  fi
}

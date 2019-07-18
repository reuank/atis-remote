atis(){
  hostname="atis"
  remotePath="Schreibtisch"
  defaultPrinter="pool-sw3"

  # Check if file specified
  if [ -z ${1} ]
  then
    echo "=> No file name specified. Aborting."
    return
  fi

  # Check if correct printer specified
  if [ -z ${2} ]
  then
    printer=$defaultPrinter
  else
    case $2 in
      pool-sw1|pool-sw2|pool-sw3|pool-farb1) 
        printer=$2;;
      sw1|sw2|sw3|farb1) 
        printer=pool-$2;;
      *) 
        printer=$defaultPrinter
        echo "=> Invalid printer. Printing on default-printer '$defaultPrinter'";;
    esac
  fi

  # Move file to atis account
  scp $1 $hostname:$remotePath

  # Print file on printer pool-sw3
  file=$( basename $1 )
  ssh $hostname "lpr -P $printer $remotePath/$file"

  if [ $? -ne 0 ]
  then
    echo "=> Printing failed."
  else
    echo "=> Printed file '$file' successfully on printer '$printer'."
  fi
}

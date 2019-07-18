atis(){
  # Check if file specified
  if [ -z ${1} ]
  then
    echo "No file name specified"
    return
  fi
  
  # Move file to atis account
  scp $1 atis:Schreibtisch

  # Print file
  file=$(basename $1)
  ssh atis "lpr -P pool-sw3 Schreibtisch/$file"

  if [ $? == 0 ]
  then
    echo "Printed file $file successfully on printer sw3."
  else
    echo "Printing failed."
  fi
}

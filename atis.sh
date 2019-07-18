atis(){
  # Check if file specified
  if [ -z ${1} ]
  then
    echo "No file name specified"
    return
  fi
  
  # Move file to atis account
  scp $1 atis:Schreibtisch

  # Print file on printer pool-sw3
  file=$(basename $1)
  ssh atis "lpr -P pool-sw$printer Schreibtisch/$file"

  if [ $? -ne 0 ]
  then
    echo "Printing failed."
  else
    echo "Printed file $file successfully on printer sw3."
  fi
}

#!/bin/bash
if [ "$(which clicklock)" != "" ] && [ "$1" == "install" ]; then
  echo "The command \"clicklock\" is already present. Can not install this."
  echo "File: \"$(which clicklock)\""
  exit 1
fi
if [ "$(which xssstart)" != "" ] && [ "$1" == "install" ]; then
  echo "The command \"xssstart\" is already present. Can not install this."
  echo "File: \"$(which xssstart)\""
  exit 1
fi
if [ "$(which xsssuspend)" != "" ] && [ "$1" == "install" ]; then
  echo "The command \"xsssuspend\" is already present. Can not install this."
  echo "File: \"$(which xsssuspend)\""
  exit 1
fi
exit 0
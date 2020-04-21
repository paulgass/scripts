#!/bin/bash

echo testifthisdebianshellhaspythontest

python --version >>checkversionpython.txt 2>&1

cvpython=$(cat checkversionpython.txt)

if [[ $cvpython = *[0-9].* ]];then
  echo "this system is running python"
else
  echo "no valid version of Python running on this system"
fi

echo goodnight

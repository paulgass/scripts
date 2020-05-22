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


checksystemforpython () {
   x=0
   a=$(python --version)
   if [[ $a = *[0-9]* ]]
   then
      x=1
      if [[ $a = *2.[0-9].[0-9]* ]]
      then
        x=2
      elif [[ $a = *3.[0-9].[0-9]* ]]
      then
        x=3
      fi
   fi
   echo $x
}

x=$(checksystemforpython)

if [ $x == 0 ]
then
elif [ $x == 1 ]
then
fi
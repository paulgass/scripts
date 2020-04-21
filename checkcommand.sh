#!/bin/bash

echo test1test1test1

workingtest="xxx3.2.3xxx"
if [[ $workingtest = *[0-9].* ]];then
  echo "result contains [0-9]. inside of it"
else
  echo "result does not contain [0-9]. inside of it"
fi

echo test4test4test4

checkcommandtest=$(python --version)

if [[ $checkcommandtest = *[0-9].* ]];then
  echo "result contains [0-9]. inside of it"
else
  echo "result does not contain [0-9]. inside of it"
fi

echo test5test5test5

workingtest5="xxxxxxxxx"
if [[ $workingtest5 = *[0-9].* ]];then
  echo "result contains [0-9]. inside of it"
else
  echo "result does not contain [0-9]. inside of it"
fi

echo test6test6test6

#python --version >>checkversionpython.txt 2>&1
python --version >>checkversionpython.txt

cvpython=$(cat checkversionpython.txt)

if [[ $cvpython = *[0-9].* ]];then
  echo "result contains [0-9]. inside of it"
else
  echo "result does not contain [0-9]. inside of it"
fi

echo goodnight

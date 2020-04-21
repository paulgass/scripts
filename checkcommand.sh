#!/bin/bash

echo testsuccesstesttestsuccesstesttestsuccesstesttestsuccesstest

workingtest="xxx3.2.3xxx"
if [[ $workingtest = *[0-9].* ]];then
  echo "result contains [0-9]. inside of it"
else
  echo "result does not contain [0-9]. inside of it"
fi

echo testsuccesstesttestsuccesstesttestsuccesstesttestsuccesstest


echo testfailtesttestfailtesttestfailtest

workingtest5="xxxxxxxxx"
if [[ $workingtest5 = *[0-9].* ]];then
  echo "result contains [0-9]. inside of it"
else
  echo "result does not contain [0-9]. inside of it"
fi

echo testfailtesttestfailtesttestfailtest

echo testfirsttesttestfirsttesttestfirsttest

python --version >>checkversionpythonfirst.txt

cvpythonfirst=$(cat checkversionpythonfirst.txt)

if [[ $cvpythonfirst = *[0-9].* ]];then
  echo "result contains [0-9]. inside of it"
else
  echo "result does not contain [0-9]. inside of it"
fi

echo testfirsttesttestfirsttesttestfirsttest

echo testsecondttesttestsecondttesttestsecondttest

python --version >>checkversionpythonsecond.txt 2>&1

cvpythonsecond=$(cat checkversionpythonsecond.txt)

if [[ $cvpythonsecond = *[0-9].* ]];then
  echo "result contains [0-9]. inside of it"
else
  echo "result does not contain [0-9]. inside of it"
fi

echo testsecondttesttestsecondttesttestsecondttest

echo goodnight

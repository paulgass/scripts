#!/bin/bash

echo "xxxxxxxxxxxx"

function myfunc()
{
    local  __resultvar=$1
    local  myresult='some value'
    if [[ "$__resultvar" ]]; then
        eval $__resultvar="'$myresult'"
    else
        echo "$myresult"
    fi
}

myfunc xxx
echo "yyyyyyyyyyy"
echo $xxx
echo "ouch"
echo $result
echo "zzzzzzzzzzz"
result2=$(myfunc)
echo $result2
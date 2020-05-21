#!/bin/bash

function myfunc()
{
    local  x=$1
    local  y='some value'
    if [[ "$x" ]]; then
        eval $x="'$y'"
    else
        echo "$y"
    fi
}

myfunc result
echo "yyyyyyyyyyy"
echo $result
echo "zzzzzzzzzzz"
result2=$(myfunc)
echo $result2

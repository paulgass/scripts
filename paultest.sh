#!/bin/bash

function myfunc()
{
    local result=$1
    local myresult='some value'
    eval $result="'$myresult'"
}

myfunc result
echo $result
#!/bin/bash
function test
{
    local -g $1
    local array=( AA BB 'C C' DD)
    eval ${1}='("${array[@]}")'
}
test VAR
echo VAR=${VAR[@]:1:2}

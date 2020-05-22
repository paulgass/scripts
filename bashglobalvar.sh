#!/bin/bash

globvar=0

function myfunc {
    echo $(($1 + 1))
}

myfunc "$globvar"
globalvar=$(echo "something" | myfunc "$globalvar")

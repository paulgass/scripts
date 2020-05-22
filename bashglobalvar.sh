#!/usr/bin/env bash

# In bash all variables are defined by default as GLOBAL, even if defined inside functions

# To define a variable as LOCAL to a function, we have to prepend "local" in the definition
# This makes the variable only defined in the current function scope and so not global.

VAR_GLOBAL="im global - you can read and change me from anywhere, even inside functions - which may not always be a good thing"
echo "Seen from outside: $VAR_GLOBAL"
function my_func {
  echo "Seen from inside my_func: $VAR_GLOBAL"
  VAR_GLOBAL="the global var was changed from inside my_func - one must be conscient when doing this or some drangons may come out inespectedly later..."
  echo "Seen from inside my_func: $VAR_GLOBAL"
}
my_func
echo "Seen from outside: $VAR_GLOBAL"

echo "------------------------"

function my_func2 {
  local VAR_LOCAL_INSIDE="var local inside"
  echo "Seen from inside my_func2: $VAR_LOCAL_INSIDE"
}
my_func2
echo "Seen from outside: $VAR_LOCAL_INSIDE"

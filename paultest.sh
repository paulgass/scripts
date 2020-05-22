#!/bin/bash
checksystemforlsb () {
   x=0
   a=$(lsb_release --short --release)
   if [[ $a = *[0-9]* ]]
   then
      x=1
   fi
   echo $x
}

globallsb=$(checksystemforlsb)
echo "here is glsb"
echo $globallsb
echo "here is glsb"
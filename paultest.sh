#!/bin/bash

checksystemforlsb () {
   x=0
   a=$(lsb_release --short --release)
   if [[ $a = *[0-9]* ]]
   then
      x=1
   fi
   return x
}

systemlsb=$(checksystemforlsb)

while [ systemlsb != 1 ]
do
   attemptlsbinstall "yum"
   systemlsb=$(checksystemforlsb)
   echo $systemlsb
   attemptlsbinstall "dnf"
   systemlsb=$(checksystemforlsb)
   echo $systemlsb
   attemptlsbinstall "apt-get"
   systemlsb=$(checksystemforlsb)
   echo $systemlsb
   attemptlsbinstall "zypper"
   systemlsb=$(checksystemforlsb)
   echo $systemlsb
   attemptlsbinstall "pacman"
   systemlsb=$(checksystemforlsb)
   echo $systemlsb
done

echo "$systemosname:$systemosversion"
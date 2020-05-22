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

attemptlsbinstall () {
   x=0
   $1 --version >packagemangerversion.txt 2>1
   a=$(cat packagemangerversion.txt)
   if [[ $a != *[0-9]* ]]
   then
      echo "$1 package manger NOT found."
   else
      if [[ $1 == "yum" ]]
      then
         sudo yum -y update && sudo yum -y install redhat-lsb-core
         x=1
      elif [[ $1 == "dnf" ]]
      then
         sudo dnf -y update && sudo dnf -y install redhat-lsb-core
         x=1
      elif [[ $1 == "apt-get" ]]
      then
         sudo apt-get update -y && sudo apt-get install -y lsb-core
         x=1
      elif [[ $1 == "zypper" ]]
      then
         sudo zypper update -y && sudo zypper install -y lsb-core
         x=1
      elif [[ $1 == "pacman" ]]
      then
         pacman -Syu lsb-release
         x=1
      fi
   fi
   rm packagemangerversion.txt
   echo $x
}

globallsb=$(checksystemforlsb)

while [[ $globallsb != 1 ]]
do
   x=$(attemptlsbinstall "yum")
   if [[ $x == 1 ]]
   then
      break
   fi
   x=$(attemptlsbinstall "dnf")
   if [[ $x == 1 ]]
   then
      break
   fi
   x=$(attemptlsbinstall "apt-get")
   if [[ $x == 1 ]]
   then
      break
   fi
   x=$(attemptlsbinstall "zypper")
   if [[ $x == 1 ]]
   then
      break
   fi
   x=$(attemptlsbinstall "pacman")
   if [[ $x == 1 ]]
   then
      break
   fi
   break
done

systemostype="default"
systemosversion="default"

if [[ $globallsb != 1 ]]
then
   systemostype=$(sysctl kern.ostype)
   systemosversion=$(sysctl kern.osrelease)
else
   systemostype=$(lsb_release --short --id)
   systemosversion=$(lsb_release --short --release)
fi

echo "$systemostype:$systemosversion"
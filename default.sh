#!/bin/bash

checksystemforlsb () {
   local x=0
   local a=$(lsb_release --short --release)
   if [[ $a = *[0-9]* ]]
   then
      x=1
   fi
   echo "systemlsb=1"
}

attemptlsbinstall () {
   $1 --version >packagemangerversion.txt 2>1
   local a=$(cat packagemangerversion.txt)
   if [[ $a != *[0-9]* ]]
   then
      echo "$1 package manger NOT found."
   else
      if [ $1 == "yum" ]
      then
         sudo yum -y update && sudo yum -y install redhat-lsb-core
      elif [ $1 == "dnf" ]
      then
         sudo dnf -y update && sudo dnf -y install redhat-lsb-core
      elif [ $1 == "apt-get" ]
      then
         sudo apt-get update -y && sudo apt-get install -y lsb-core
      elif [ $1 == "zypper" ]
      then
         sudo zypper update -y && sudo zypper install -y lsb-core
      elif [ $1 == "pacman" ]
      then
         pacman -Syu lsb-release
      fi
      systemlsb=1
   fi
   rm packagemangerversion.txt
}

systemlsb=$(checksystemforlsb)

while [ systemlsb != 1 ]
do
   attemptlsbinstall "yum"
   attemptlsbinstall "dnf"
   attemptlsbinstall "apt-get"
   attemptlsbinstall "zypper"
   attemptlsbinstall "pacman"
done

systemostype="default"
systemosversion="default"

if [ systemlsb == false ]
then
   systemostype=$(sysctl kern.ostype)
   systemosversion=$(sysctl kern.osrelease)
else
   systemostype=$(lsb_release --short --id)
   systemosversion=$(lsb_release --short --release)
fi

echo "$systemosname:$systemosversion"
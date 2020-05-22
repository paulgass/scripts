#!/bin/bash

checksystemforlsb () {
   a=$(lsb_release --short --release)
   if [[ $a = *[0-9]* ]]
   then
      export globallsb=1
   fi
}

attemptlsbinstall () {
   $1 --version >packagemangerversion.txt 2>1
   a=$(cat packagemangerversion.txt)
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
   fi
   rm packagemangerversion.txt
}

export globallsb=0
checksystemforlsb

while [[ $globallsb != 1 ]]
do
   attemptlsbinstall "yum"
   checksystemforlsb
   attemptlsbinstall "dnf"
   checksystemforlsb
   attemptlsbinstall "apt-get"
   checksystemforlsb
   attemptlsbinstall "zypper"
   checksystemforlsb
   attemptlsbinstall "pacman"
   break
done

systemostype="default"
systemosversion="default"

if [ $globallsb != 1 ]
then
   systemostype=$(sysctl kern.ostype)
   systemosversion=$(sysctl kern.osrelease)
else
   systemostype=$(lsb_release --short --id)
   systemosversion=$(lsb_release --short --release)
fi

echo "$systemostype:$systemosversion"
#!/bin/bash

checksystemforpackagemanager () {
   $1 --version >pmv.txt 2>1
   v=$(cat pmv.txt)
   if [[ $v != *[0-9]* ]]
   then
      echo "$1 package manger NOT found."
   fi
   rm pmv.txt
}

defaultpackagemanager="none"
lsbreleaseversionnumber=$(lsb_release --short --release)

if [[ $lsbreleaseversionnumber = *[0-9]* ]]
then
   os=$(lsb_release --short --id)
   if [[ $os = *centos* ]]
   then
      defaultpackagemanager="yum"
   elif [[ $os = *debian* ]] || [[ $os = *ubuntu* ]]
   then
      defaultpackagemanager="apt-get"
   elif [[ $os == *fedora* ]]
   then
      defaultpackagemanager="dnf"
   elif [[ $os == *opensuse* ]]
   then
      defaultpackagemanager="zypper"
   elif [[ $os == *arch* ]]
   then
      defaultpackagemanager="pacman"
   else
      echo "cannot determine package manager for $os"
   fi
fi

if [[ $defaultpackagemanager == "none" ]]
then
   checksystemforpackagemanager "yum"
   checksystemforpackagemanager "dnf"
   checksystemforpackagemanager "apt-get"
   checksystemforpackagemanager "zypper"
   checksystemforpackagemanager "pacman"
   checksystemforpackagemanager "brew"
   checksystemforpackagemanager "snap"
else
   if [ defaultpackagemanager="yum" ]
   then
      sudo yum -y update && sudo yum -y install redhat-lsb-core
   elif [ defaultpackagemanager="dnf" ]
   then
      sudo dnf -y update && sudo dnf -y install redhat-lsb-core
   elif [ defaultpackagemanager="apt-get" ]
   then
      sudo apt-get update -y && sudo apt-get install -y lsb-core
   elif [ defaultpackagemanager="zypper" ]
   then
      sudo zypper update -y && sudo zypper install -y lsb-core
   elif [ defaultpackagemanager="pacman" ]
   then
      pacman -Syu lsb-release
   else
      echo "cannot install lsb_release"
   fi
fi

echo goodnightlollol
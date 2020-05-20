#!/bin/bash

#OS AGNOSTIC SCRIPT
#maybe change to #!/bin/sh
#this scripts should work for the following: #debian #ubuntu #centos #fedora #openSUSE #arch#macoszsh #macosbash

packagemanager=""
lsbreleaseversionnumber=$(lsb_release --short --release)

if [[ $lsbreleaseversionnumber = *[0-9]* ]]
then
   packagemanager="default"
else
   break
fi

packagemanagerversion () {
   $1 --version >pmv.txt 2>1
   v=$(cat pmv.txt)
   if [[ $v = *[0-9]* ]]
   then
      if [[ $1 = "yum" ]]
      then
         sudo yum -y update && sudo yum -y install redhat-lsb-core
      elif [ $1 == 'dnf' ]
      then
         sudo dnf -y update && sudo dnf -y install redhat-lsb-core
      elif [ $1 == 'apt-get' ]
      then
         sudo apt-get update -y && sudo apt-get install -y lsb-core
      elif [ $1 == 'zypper' ]
      then
         sudo zypper update -y && sudo zypper install -y lsb-core
      elif [ $1 == 'pacman' ]
      then
         pacman -Syu lsb-release
      fi
   else
      echo "$1 package manger NOT found."
   fi
}

if [[ $packagemanager != "default" ]] ; then
   packagemanagerversion "rpm"
   packagemanagerversion "yum"
   packagemanagerversion "dnf"
   packagemanagerversion "apt"
   packagemanagerversion "apt-get"
   packagemanagerversion "zypper"
   packagemanagerversion "pacman"
fi

echo goodnightlollol
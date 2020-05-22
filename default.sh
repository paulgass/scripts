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
   if [[ $a == *[0-9]* ]]
   then
      if [ $1 == "yum" ]
      then
         #sudo yum -y update && sudo yum -y install redhat-lsb-core
         echo "sudo yum -y update && sudo yum -y install redhat-lsb-core"
         x=1
      elif [ $1 == "dnf" ]
      then
         sudo dnf -y update && sudo dnf -y install redhat-lsb-core
         x=1
      elif [ $1 == "apt-get" ]
      then
         sudo apt-get update -y && sudo apt-get install -y lsb-core
         x=1
      elif [ $1 == "zypper" ]
      then
         sudo zypper update -y && sudo zypper install -y lsb-core
         x=1
      elif [ $1 == "pacman" ]
      then
         pacman -Syu lsb-release
         x=1
      fi
      x=$(checksystemforlsb)
   fi
   rm packagemangerversion.txt
   echo $x
}

checksystemforpython () {
   x=0
   a=$(python --version)
   if [[ $a = *[0-9]* ]]
   then
      x=1
      if [[ $a = *2.[0-9].[0-9]* ]]
      then
        x=2
      elif [[ $a = *3.[0-9].[0-9]* ]]
      then
        x=3
      fi
   fi
   echo $x
}

globallsb=$(checksystemforlsb)

# while [[ $globallsb != 1 ]]
# do
#    attemptlsbinstall "yum"
#    attemptlsbinstall "dnf"
#    attemptlsbinstall "apt-get"
#    attemptlsbinstall "zypper"
#    attemptlsbinstall "pacman"
#    break
# done

if [ $globallsb -eq 0 ]
then
   i=0
   packagemanagerarray=("yum" "dnf" "apt-get" "zypper" "pacman")
   while true
   do
      a="${packagemanagerarray[$i]}"
      x=$(attemptlsbinstall "${packagemanagerarray[$i]}")
      echo "indexabove"
      echo $a
      echo "indexabove"
      echo "xbelow"
      echo $x
      echo "xabove"
      echo "ibelow"
      echo $i
      echo "iabove"
      if [[ $x -eq 1 ]]
      then
         break
      fi
      ((i++))
   done
fi

globallsb=$(checksystemforlsb)
systemostype="default"
systemosversion="default"

if [ $globallsb == 1 ]
then
   systemostype=$(lsb_release --short --id)
   systemosversion=$(lsb_release --short --release)
else
   systemostype=$(sysctl kern.ostype)
   if [[ $systemostype != *Darwin* ]]
   then
      systemosversion=$(sysctl kern.osrelease)
   else
      systemostype="default"
   fi
fi

echo "$systemostype:$systemosversion"

systempython=$(checksystemforpython)

if [ $systempython -ge 0 ]
then
   python --version
fi
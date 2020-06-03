#!/bin/sh

checksystemforlsb () {
   x=0
   a=$(lsb_release --short --release)
   if [[ $a == *[0-9]* ]]
   then
      x=1
   fi
   echo $x
}

attemptlsbinstall () {
   $1 --version >packagemangerversion.txt 2>1
   a=$(cat packagemangerversion.txt)
   if [[ $a == *[0-9]* ]]
   then
      if [ "$1" = "yum" ]
      then
         sudo yum -y update && sudo yum -y install redhat-lsb-core
      elif [ "$1" = "dnf" ]
      then
         export DEBIAN_FRONTEND=noninteractive
         sudo dnf -y update && sudo dnf -y install redhat-lsb-core
      elif [ "$1" = "apt-get" ]
      then
         sudo apt-get update -y && sudo apt-get install -y lsb-core
      elif [ "$1" = "zypper" ]
      then
         sudo zypper update -y && sudo zypper install -y lsb-core
      elif [ "$1" = "pacman" ]
      then
         pacman -Syu lsb-release
      fi
   fi
   rm packagemangerversion.txt
}

checksystemforpython () {
   x=0
   a=$(python --version)
   if [[ $a == *[0-9]* ]]
   then
      x=1
      if [[ $a == *2.[0-9].[0-9]* ]]
      then
        x=2
      elif [[ $a == *3.[0-9].[0-9]* ]]
      then
        x=3
      fi
   fi
   echo $x
}

systemos="none"
systemostype="none"
systemosversion="none"
systemarch="none"

case "$(uname -s)" in
   Linux)
      systemos="linux"
      systemostype="linux"
      systemosversion=$(uname -r)
      systemarch=$(arch)
      systemlsb=$(checksystemforlsb)
      if [ $systemlsb -eq 0 ]
      then
         arr=("yum" "dnf" "apt-get" "zypper" "pacman") 
         for i in "${arr[@]}"
         do
            attemptlsbinstall $i
            x=$(checksystemforlsb)
            if [ $x -eq 1 ]
            then
               break
            fi
         done
      fi
      systemlsb=$(checksystemforlsb)
      if [ $systemlsb -eq 1 ]
      then
         systemostype=$(lsb_release --short --id)
         systemosversion=$(lsb_release --short --release)
      fi
      ;;
   Darwin)
      systemos="macos"
      systemostype="macos"
      systemosversion=$(uname -r)
      systemarch=$(arch)
      ;;
   CYGWIN*|MSYS*|MINGW*)
      systemos="windows"
      systemostype="windows"
      systemosversion=$(uname -r)
      wmic OS get OSArchitecture >windowsarchitecture.txt 2>1
      winarch=$(cat windowsarchitecture.txt)
      if [[ $winarch == *64* ]]
      then
         systemarch="64bit"
      elif [[ $winarch == *32* ]]
      then
         systemarch="32bit"
      fi
      rm windowsarchitecture.txt
      ;;
   *)
      systemos="default"
      systemostype="default"
      systemosversion=$(uname -r)
      systemarch=$(uname -p)
      ;;
esac

echo "OS: $systemos Type: $systemostype Version: $systemosversion Architecture: $systemarch"

systempython=$(checksystemforpython)

if [ $systempython -ge 1 ]
then
   python --version
fi
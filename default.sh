#!/bin/sh

checksystemforlsb () {
   x=0
   a=$(lsb_release --short --release)
   if [[ $a =~ *[0-9]* ]]
   then
      x=1
   fi
   echo $x
}

attemptlsbinstall () {
   $1 --version >packagemangerversion.txt 2>1
   a=$(cat packagemangerversion.txt)
   if [[ $a =~ *[0-9]* ]]
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
   if [[ $a =~ *[0-9]* ]]
   then
      x=1
      if [[ $a =~ *2.[0-9].[0-9]* ]]
      then
        x=2
      elif [[ $a =~ *3.[0-9].[0-9]* ]]
      then
        x=3
      fi
   fi
   echo $x
}

systemostype="none"
systemosversion="none"
systemuname=$(uname -s)

if [ "$systemuname" = "Darwin" ]
then
   systemostype="macos"
   systemosversion="darwin"
elif [ "$systemuname" = "Linux" ]
then
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
   if [ $systemlsb -eq 1 ]
   then
      systemostype=$(lsb_release --short --id)
      systemosversion=$(lsb_release --short --release)
   fi
else
   systemostype="unknown"
   systemosversion="unknown"
fi

systemos=$(echo $systemostype | tr '[:upper:]' '[:lower:]')

case $systemos in
rhel)
	echo "Red Hat RHEL System lsb_release: $systemostype:$systemosversion"
	;;
centos)
	echo "Linux CentOS System lsb_release: $systemostype:$systemosversion"
	;;
fedora)
	echo "Linux Fedora System lsb_release: $systemostype:$systemosversion"
	;;
debian)
	echo "Linux Debian System lsb_release: $systemostype:$systemosversion"
	;;
ubuntu)
	echo "Linux Ubuntu System lsb_release: $systemostype:$systemosversion"
	;;
darwin)
	echo "Macos Darwin System kernel: $systemostype:$systemosversion"
	;;
*)
	echo "Default System: $systemostype:$systemosversion"
	;;
esac

systempython=$(checksystemforpython)

if [ $systempython -ge 1 ]
then
   python --version
fi
#!/bin/bash

#OS AGNOSTIC SCRIPT
#maybe change to #!/bin/sh
#this scripts should work for the following:
#debian
#ubuntu
#centos
#fedora
#openSUSE
#arch
#macoszsh
#macosbash

if [[ $EUID -ne 0 ]]; then
   echo "THIS SCRIPT MUST BE RUN AS 'root' USER"
   exit 1
fi

packagemanager=""

lsb_release --release --short >lsbversion.txt 2>&1

lsbv=$(cat lsbversion.txt)

if [[ $lsbv = *[0-9]* ]] ; then
   packagemanager="default"
else
   echo "lsb_release command not found."
fi

packagemanagerversion () {
   $1 --version >pmv.txt 2>1
   version=$(cat pmv.txt)
   if [[ $version = *[0-9]* ]] ; then
      echo "$1 configuration found."
   else
      echo "$1 configuration NOT found."
   fi
}

if [ $packagemanager != "" ] ; then
   packagemanagerversion "rpm"
   packagemanagerversion "yum"
   packagemanagerversion "dnf"
   packagemanagerversion "apt"
   packagemanagerversion "apt-get"
   packagemanagerversion "zypper"
   packagemanagerversion "pacman"
fi

echo goodnightlol
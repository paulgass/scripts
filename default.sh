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

lsbversion=$(lsb_release --short --release)

if [[ $lsbversion = *[0-9]* ]] ; then
   packagemanager="default"
   echo "package set to default stuff"
else
   echo "lsb_release command not found."
fi

packagemanagerversion () {
   $1 --version >pmv.txt 2>1
   v=$(cat pmv.txt)
   if [[ $v = *[0-9]* ]] ; then
      echo "$1 package manger found."
   else
      echo "$1 package manger NOT found."
   fi
}

if [[ $packagemanager == "default" ]] ; then
   packagemanagerversion "rpm"
   packagemanagerversion "yum"
   packagemanagerversion "dnf"
   packagemanagerversion "apt"
   packagemanagerversion "apt-get"
   packagemanagerversion "zypper"
   packagemanagerversion "pacman"
fi

echo goodnightlollol
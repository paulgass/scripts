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

NOWSECOND=$(date +"%Y%m%d%H%M%S")
scriptfolder=script${NOWSECOND}folder
mkdir $scriptfolder
cd $scriptfolder/
directory=$(pwd)
cd $directory/

print_something () {
   echo Hello $1
}

print_something Mars
print_something Jupiter

#apt --version >>versionapt.txt 2>&1

#apt-get --version >>versionaptget.txt 2>&1

#rpm --version >>versionrpm.txt 2>&1

#yum --version >>versionyum.txt 2>&1

#dnf --version >>versiondnf.txt 2>&1

#zypper --version >>versionzypper.txt 2>&1

#pacman --version >>versionpacman.txt 2>&1


lsb_release --release --short >>versionlsbrelease.txt 2>&1

versionlsbrelease=$(cat versionlsbrelease.txt)

if [ $versionlsbrelease = *[0-9]* ] ; then
   packagemanager="default"
else
   echo "lsb_release command not found."
fi

echo "Package Manager Function..."

packagemanagerversion () {
   echo hello
   $1 --version
   echo goodbye
   $1 --version >> pmv.txt
   echo hola
   cat pmv.txt
   echo adios
   version=$(cat pmv.txt)
   if [[ $version = *[0-9]* ]] ; then
      echo "$1 configuration found."
   else
      echo "$1 configuration NOT found."
   fi
}

packagemanagerversion rpm
packagemanagerversion yum
packagemanagerversion dnf
packagemanagerversion apt
#packagemanagerversion apt-get
packagemanagerversion zypper
packagemanagerversion pacman

echo goodnight

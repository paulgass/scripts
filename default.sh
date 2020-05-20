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

packagemanager=""

echo "Now scanning to find configured Package Manager for this system..."
echo "apt..."

apt --version >>versionapt.txt 2>&1

versionapt=$(cat versionapt.txt)

if [[ $versionapt = *[0-9].* ]];then
  echo "this system is configured with apt Package Manager"
  packagemanager="apt"
else
  echo "this system is NOT configured with apt Package Manager"
fi

echo "apt-get..."

apt --version >>versionaptget.txt 2>&1

versionaptget=$(cat versionaptget.txt)

if [[ $versionaptget = *[0-9].* ]];then
  echo "this system is configured with apt-get Package Manager"
  packagemanager="apt-get"
else
  echo "this system is NOT configured with apt-get Package Manager"
fi

echo goodnight

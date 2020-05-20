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
packagemanager=""

echo "...lsb_release..."

lsb_release --version >>versionlsbrelease.txt 2>&1

versionlsbrelease=$(cat versionlsbrelease.txt)

if [ $versionlsbrelease = *[0-9].* ] ; then
   packagemanager="default"
else
   echo "lsb_release command not found."
fi

echo "...rpm..."

apt --version >>versionrpm.txt 2>&1

versionrpm=$(cat versionrpm.txt)

if [ $packagemanager != "" ] && [ $versionrpm = *[0-9].* ] ; then
   packagemanager="rpm"
else
   echo "RPM configuration not found."
fi

echo "...apt..."

apt --version >>versionapt.txt 2>&1

versionapt=$(cat versionapt.txt)

if [ $packagemanager != "" ] && [ $versionapt = *[0-9].* ] ; then
   packagemanager="apt"
else
   echo "APT configuration not found."
fi

echo "...apt-get..."

apt-get --version >>versionaptget.txt 2>&1

versionaptget=$(cat versionaptget.txt)

if [ $packagemanager != "" ] && [ $versionaptget = *[0-9].* ] ; then
   packagemanager="apt-get"
else
   echo "APT-GET configuration not found."
fi

echo goodnight

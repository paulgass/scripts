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

checksystemforpackagemanager "yum"
checksystemforpackagemanager "dnf"
checksystemforpackagemanager "apt-get"
checksystemforpackagemanager "zypper"
checksystemforpackagemanager "pacman"
checksystemforpackagemanager "brew"
checksystemforpackagemanager "snap"

echo goodnightlollol
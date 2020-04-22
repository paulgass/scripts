#!/bin/bash

# yum install redhat-lsb-core 
#or
# yum install redhat-lsb

# dnf install redhat-lsb-core
#or
# dnf install redhat-lsb

placeholder_linux_distro_version_name=$(lsb_release -si)
linux_distro_version_name=$(sed -e 's/\(.*\)/\L\1/' <<< "$placeholder_linux_distro_version_name")

linux_distro_version_id=$(lsb_release -sr)

echo ""
echo ""
echo "Linux Distro Version Name:"
echo "$linux_distro_version_name"
echo ""
echo "Linux Distro Version ID:"
echo "$linux_distro_version_id"
echo ""

if [ $linux_distro_version_name == 'debian' ] ; then
	cd
	echo "plan to use apt-get"
fi

cd

echo "install instructions below"

case $linux_distro_version_name in
debian)
	echo "use apt-get"
	;;
ubuntu)
	echo "use apt-get"
	;;
fedora)
	echo "use yum"
	;;
centos)
	echo "use yum"
	;;
*)
	echo "linux distro not recognized by this script"
	;;
esac

#!/bin/bash

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

if [ $linux_distro_version_name == 'ubuntu' ] ; then
	cd
	echo "plan to use apt-get"
fi

cd

if [ $linux_distro_version_name == 'fedora' ] ; then
	cd
	echo "plan to use yum"
fi

cd

if [ $linux_distro_version_name == 'centos' ] ; then
	cd
	echo "plan to use yum"
fi

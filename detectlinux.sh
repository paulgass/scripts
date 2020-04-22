#!/bin/bash

# apt-get update -y && apt-get upgrade -y && apt-get install lsb-release -y && apt-get clean all
#or
# apt-get update -y && apt-get upgrade -y && apt-get install lsb-release-core -y && apt-get clean all

# yum update -y && yum upgrade -y && yum install redhat-lsb-core -y
#or
# yum update -y && yum upgrade -y && yum install redhat-lsb -y

# dnf install redhat-lsb-core
#or
# dnf install redhat-lsb

#####fedora
#sudo dnf upgrade --refresh
###sudo reboot
#sudo dnf install dnf-plugin-system-upgrade
#sudo dnf system-upgrade download --refresh --releasever=31
#sudo dnf system-upgrade reboot
#####fedora

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

command1="echo hello"
command2="echo lol"
command3="echo world"

echo "install instructions below"

case $linux_distro_version_name in
debian)
	echo "use apt-get"
	command2="lmao"
	;;
ubuntu)
	echo "use apt-get"
	;;
fedora)
	echo "use yum"
	;;
centos)
	echo "use yum"
	command2="lmfao"
	;;
*)
	echo "linux distro not recognized by this script"
	;;
esac

cd
echo "Executing command1..."
$command1
echo "Executing command2..."
$command2
echo "Executing command3..."
$command3

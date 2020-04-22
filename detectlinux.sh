#!/bin/bash

linux_distro_version_name=$(lsb_release -si)
#ldv_name="echo '$linux_distro_version_name' | sed -e 's/\(.*\)/\L\1/'"
#ldv_name="echo '$linux_distro_version_name' | awk '{print tolower($0)}'"
ldv_name="sed -e 's/\(.*\)/\L\1/' <<< '$linux_distro_version_name'"

linux_distro_version_id=$(lsb_release -sr)
ldv_id="sed -e 's/\(.*\)/\L\1/' <<< '$linux_distro_version_name'"

echo ""
echo "this is a $linux_distro_version_name $linux_distro_version_id system"
echo ""
echo "$ldv_name"
echo "$ldv_id"
echo ""

if [ $ldv_name == 'debian' ] ; then
	cd
	echo "plan to use apt-get"
fi

cd

if [ $ldv_name == 'ubuntu' ] ; then
	cd
	echo "plan to use apt-get"
fi

cd

if [ $ldv_name == 'fedora' ] ; then
	cd
	echo "plan to use yum"
fi

cd

if [ $ldv_name == 'centos' ] ; then
	cd
	echo "plan to use yum"
fi

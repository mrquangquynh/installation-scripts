#!/bin/bash


function print_usage
{
	echo "Usage:"
	echo "    $0 <domain_name>"
	exit 1
}

if [ `lsb_release --description | grep 'Ubuntu 10.04' | wc -l` -eq 0 ]
then
    echo "MUST BE a fresh installation of Ubuntu 10.04 Server"
    exit 1
fi

if [ `whoami` == "root" ]
then
    echo "This script shouldn't be executed as root"
    exit 1
fi

if [ $# -ne 1 ]
then
	print_usage
fi


echo "Updating Unzip"


sudo apt-get install unzip

if [ ! -d "download_bbb32-64b" ]; then
	if [ -f download_bbb32-64b.zip ]; then
		echo "Unzip goi tin"
		unzip download_bbb32-64b.zip
		
	fi

fi

sudo cp -r ~/download_bbb32-64b/var_cache_apt_archives/*.deb /var/cache/apt/archives/
sudo cp -r ~/download_bbb32-64b/var_lib_apt_lists/* /var/lib/apt/lists/



echo "Updating the Ubuntu package repository"
sudo apt-get -y update
sudo apt-get install bmon
sudo apt-get -y install mysql-server
sudo apt-get -y install git-core htop iftop ant curl

mkdir -p ~/tools
cd ~/tools
if [ -d "installation-scripts" ]
then
    cd installation-scripts
    git pull origin master
    cd ..
else
    git clone git://github.com/mrquangquynh/installation-scripts.git
fi
cd installation-scripts/bbb-deploy/

chmod +x install-bigbluebutton0.80.sh
./install-bigbluebutton0.80.sh

sudo video-conf --setip $1

chmod +x install-bigbluebutton0.80-dev.sh
./install-bigbluebutton0.80-dev.sh

sudo video-conf --setip $1

rm ~/download_bbb32-64b.zip
rm -rf ~/download_bbb32-64b
rm -rf ~/Script_install_video

echo "Clear history web and login with IP $1 (not use :80)"
echo "It will take a while to start the live notes server, please be patient"

cd 
chmod +x clear.sh
./clear.sh

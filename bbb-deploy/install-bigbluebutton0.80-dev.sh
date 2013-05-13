
#!/bin/bash


#Cac buoc cai dat BBB0.8 DEV

video-conf --setup-dev tools

echo "------------source ~/.profile-----------------"

source ~/.profile

echo "------------git clone github.com/.../.../-----------------"


cd ~/dev

git clone https://github.com/bigbluebutton/bigbluebutton

echo "------------git status - checkout -----------------"

cd ~/dev/bigbluebutton

git checkout -b my-bbb-branch v0.8


video-conf --setup-dev client

echo "#-------------------------Thay doi code Devlopment-----------------------"

sudo mv ~/dev/bigbluebutton/bigbluebutton-client/src ~/dev/bigbluebutton/bigbluebutton-client/src.old
sudo mv ~/dev/bigbluebutton/bigbluebutton-client/locale ~/dev/bigbluebutton/bigbluebutton-client/locale.old
sudo mv ~/Script_install_video/bbb-dev0.80/src ~/dev/bigbluebutton/bigbluebutton-client/
sudo mv ~/Script_install_video/bbb-dev0.80/locale ~/dev/bigbluebutton/bigbluebutton-client/


echo "------------Build Flash -----------------"

cd ~/dev/bigbluebutton/bigbluebutton-client

ant

echo "------------Build langue -----------------"

ant locales

cd

echo "#-------------------------Thay doi giao dien ben Devlopment-----------------------"

sudo mv ~/Script_install_video/bbb-dev0.80/branding ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/dev/bigbluebutton/bigbluebutton-client/bin/conf ~/dev/bigbluebutton/bigbluebutton-client/bin/conf.old
sudo cp -r ~/Script_install_video/bbb-dev0.80/conf ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/dev/bigbluebutton/bigbluebutton-client/bin/lib ~/dev/bigbluebutton/bigbluebutton-client/bin/lib.old
sudo mv ~/Script_install_video/bbb-dev0.80/lib ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/Script_install_video/bbb-dev0.80/LayoutModule.swf ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/Script_install_video/bbb-dev0.80/video.html ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/dev/bigbluebutton/bigbluebutton-client/bin/BigBlueButton.swf ~/dev/bigbluebutton/bigbluebutton-client/bin/video.swf



echo "#-------------------------Doi client --> bkippbx (ben Devlopment)-----------------------"
sudo mv ~/dev/bigbluebutton/bigbluebutton-client/client ~/dev/bigbluebutton/bigbluebutton-client/bkippbx
sudo mv /etc/bigbluebutton/nginx/client_dev /etc/bigbluebutton/nginx/client_dev.old
sudo mv ~/Script_install_video/bbb-dev0.80/client_dev /etc/bigbluebutton/nginx/
sudo chmod 755 /etc/bigbluebutton/nginx/client_dev






























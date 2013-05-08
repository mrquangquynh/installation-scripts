#!/bin/bash

sudo video-conf --setup-dev tools

source ~/.profile

cd ~/dev

git clone https://github.com/quangquynh-bbb081/bigbluebutton

cd ~/dev/bigbluebutton

git status

git checkout -b my-bbb-branch v0.8

git status

cd 
video-conf --setup-dev client

sudo mv ~/dev/bigbluebutton/bigbluebutton-client/src ~/dev/bigbluebutton/bigbluebutton-client/src.old
sudo mv ~/dev/bigbluebutton/bigbluebutton-client/locale ~/dev/bigbluebutton/bigbluebutton-client/locale.old
sudo mv ~/Script_install_video/bbb-dev0.80/src ~/dev/bigbluebutton/bigbluebutton-client/
sudo mv ~/Script_install_video/bbb-dev0.80/locale ~/dev/bigbluebutton/bigbluebutton-client/


cd ~/dev/bigbluebutton/bigbluebutton-client
ant
ant locales

cd 

sudo mv ~/Script_install_video/bbb-dev0.80/branding ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/dev/bigbluebutton/bigbluebutton-client/bin/conf ~/dev/bigbluebutton/bigbluebutton-client/bin/conf.old
sudo mv ~/Script_install_video/bbb-dev0.80/conf ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/dev/bigbluebutton/bigbluebutton-client/bin/lib ~/dev/bigbluebutton/bigbluebutton-client/bin/lib.old
sudo mv ~/Script_install_video/bbb-dev0.80/lib ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/Script_install_video/bbb-dev0.80/LayoutModule.swf ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/Script_install_video/bbb-dev0.80/client.html ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/dev/bigbluebutton/bigbluebutton-client/bin/BigBlueButton.swf ~/dev/bigbluebutton/bigbluebutton-client/bin/video.swf


video-conf --setip 192.168.1.14:80

#Chuyển về BBB thường dùng   :
#              $   sudo ln -s -f /etc/bigbluebutton/nginx/client /etc/bigbluebutton/nginx/client.nginx
#              $   sudo /etc/init.d/nginx restart     
#Chuyển về BBB-dev : 
#              $  sudo ln -s -f /etc/bigbluebutton/nginx/client_dev /etc/bigbluebutton/nginx/client.nginx
#              $  sudo /etc/init.d/nginx restart  







































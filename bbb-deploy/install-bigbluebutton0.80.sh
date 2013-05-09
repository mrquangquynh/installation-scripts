#!/bin/bash

#-----------------Install Ruby-------------------------------
chmod +x install-ruby.sh
./install-ruby.sh

#-----------------Install LibreOffice------------------------- 
#chmod +x install-libreoffice.sh
#./install-libreoffice.sh

#-----------------Install ffmpeg------------------------------
#chmod +x install-ffmpeg.sh
#./install-ffmpeg.sh

#----------------------BBB 0.8---------------------------------
# Add the BigBlueButton key
wget http://ubuntu.bigbluebutton.org/bigbluebutton.asc -O- | sudo apt-key add -

# Add the BigBlueButton repository URL and ensure the multiverse is enabled
echo "deb http://ubuntu.bigbluebutton.org/lucid_dev_08/ bigbluebutton-lucid main" | sudo tee /etc/apt/sources.list.d/bigbluebutton.list
echo "deb http://us.archive.ubuntu.com/ubuntu/ lucid multiverse" | sudo tee -a /etc/apt/sources.list
#-----------------------------------------------------------------
#---------------------BBB 0.81 -------------------------------------
# Add the BigBlueButton key
wget http://ubuntu.bigbluebutton.org/bigbluebutton.asc -O- | sudo apt-key add -

# Add the BigBlueButton repository URL and ensure the multiverse is enabled
#echo "deb http://ubuntu.bigbluebutton.org/lucid_dev_081/ bigbluebutton-lucid main" | sudo tee /etc/apt/sources.list.d/bigbluebutton.list
#echo "deb http://us.archive.ubuntu.com/ubuntu/ lucid multiverse" | sudo tee -a /etc/apt/sources.list

#------------------------------------------------------------------------


#------------------------Cai dat BBB 0.8------------------------------------------------
echo "Updating the Ubuntu package repository"
sudo apt-get update > /dev/null
sudo apt-get -y dist-upgrade
sudo apt-get -y install bigbluebutton bbb-demo

#-----------------------Xoa Freeswitch luc khoi dong--------------------
sudo /etc/init.d/bbb-freeswitch stop
sudo update-rc.d -f bbb-freeswitch remove

#-----------------------Thay file bbb-conf = video-conf --------------------
sudo mv /usr/local/bin/bbb-conf /usr/local/bin/bbb-conf.old 
sudo mv ~/Script_install_video/video-conf /usr/local/bin/
sudo chmod 755 /usr/local/bin/video-conf

#-----------------------Thay file red5 co freeswitch = red5 khoi dong ko co freeswitch --------------------
sudo mv /etc/init.d/red5 /etc/init.d/red5.old
sudo mv ~/Script_install_video/red5 /etc/init.d/
sudo chmod 755 /etc/init.d/red5

#-----------------------Them file conect mysql --------------------
sudo mv ~/Script_install_video/mysql-connector-java-5.1.10.jar /usr/share/tomcat6/lib/

#-----------------------Them Font VNi ------------------------------
sudo cp -r ~/Script_install_video/windows /usr/share/fonts/truetype/
sudo sudo fc-cache -f -v

#-----------------------Them File Demo/login------------------------------
sudo mv ~/Script_install_video/login /var/lib/tomcat6/webapps/demo/
sudo cp /var/lib/tomcat6/webapps/demo/bbb_api.jsp /var/lib/tomcat6/webapps/demo/login/
sudo cp /var/lib/tomcat6/webapps/demo/bbb_api_conf.jsp /var/lib/tomcat6/webapps/demo/login/

sudo mkdir /var/lib/tomcat6/webapps/demo/demo.old
sudo mv /var/lib/tomcat6/webapps/demo/*.jsp /var/lib/tomcat6/webapps/demo/demo.old/

sudo rm /var/lib/tomcat6/webapps/demo/css
sudo rm /var/lib/tomcat6/webapps/demo/js
sudo rm /var/lib/tomcat6/webapps/demo/images
sudo rm /var/lib/tomcat6/webapps/demo/pdfs
sudo rm /var/lib/tomcat6/webapps/demo/polling.gif
sudo rm /var/lib/tomcat6/webapps/demo/BigBlueButton.pptx

#-----------------------Them File Demo/login------------------------------

sudo mv /var/www/bigbluebutton-default /var/www/bigbluebutton-default.old
sudo mv ~/Script_install_video/bigbluebutton-default /var/www/

#------------------------Sua file bigbluebutton.properties----------------

sudo mv /var/lib/tomcat6/webapps/bigbluebutton/WEB-INF/classes/bigbluebutton.properties /var/lib/tomcat6/webapps/bigbluebutton/WEB-INF/classes/bigbluebutton.properties.old
sudo mv ~/Script_install_video/bigbluebutton.properties /var/lib/tomcat6/webapps/bigbluebutton/WEB-INF/classes/bigbluebutton.properties
sudo video-conf --salt


#-------------------------Doi client --> bkippbx (ben Setup)-----------------------

sudo mv /var/www/bigbluebutton/client /var/www/bigbluebutton/bkippbx
sudo mv /etc/bigbluebutton/nginx/client /etc/bigbluebutton/nginx/client.old
sudo mv ~/Script_install_video/client /etc/bigbluebutton/nginx/
sudo chmod 755 /etc/bigbluebutton/nginx/client
 




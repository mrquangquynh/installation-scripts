#!/bin/bash

sudo video-conf --setup-dev tools

source ~/.profile

cd ~/dev

git clone https://github.com/quangquynh-bbb081/bigbluebutton

cd ~/dev/bigbluebutton

git status

git checkout -b my-bbb-branch v0.8

git status

cd ../..
bbb-conf --setup-dev client

sudo mv ~/dev/bigbluebutton/bigbluebutton-client/src ~/dev/bigbluebutton/bigbluebutton-client/src.old
sudo mv ~/dev/bigbluebutton/bigbluebutton-client/locale ~/dev/bigbluebutton/bigbluebutton-client/locale.old
sudo mv ~/Script_install_video/bbb-dev0.80/src ~/dev/bigbluebutton/bigbluebutton-client/
sudo mv ~/Script_install_video/bbb-dev0.80/locale ~/dev/bigbluebutton/bigbluebutton-client/


cd ~/dev/bigbluebutton/bigbluebutton-client
ant
ant locales

sudo mv ~/Script_install_video/bbb-dev0.80/branding ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/dev/bigbluebutton/bigbluebutton-client/bin/conf ~/dev/bigbluebutton/bigbluebutton-client/bin/conf.old
sudo mv ~/Script_install_video/bbb-dev0.80/conf ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/dev/bigbluebutton/bigbluebutton-client/bin/lib ~/dev/bigbluebutton/bigbluebutton-client/bin/lib.old
sudo mv ~/Script_install_video/bbb-dev0.80/lib ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/Script_install_video/bbb-dev0.80/LayoutModule.swf ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/Script_install_video/bbb-dev0.80/client.html ~/dev/bigbluebutton/bigbluebutton-client/bin/
sudo mv ~/dev/bigbluebutton/bigbluebutton-client/bin/BigBlueButton.swf ~/dev/bigbluebutton/bigbluebutton-client/bin/video.swf
























sudo apt-get -y install openjdk-6-jdk

















# https://github.com/harrah/xsbt/wiki/Setup
mkdir -p ~/tools
cd ~/tools
rm -r xsbt*
wget -O xsbt.tar.gz https://github.com/harrah/xsbt/tarball/v0.11.2
tar xf xsbt.tar.gz
mv -i harrah-xsbt-* xsbt
wget -O sbt-launch.jar http://typesafe.artifactoryonline.com/typesafe/ivy-releases/org.scala-tools.sbt/sbt-launch/0.11.2/sbt-launch.jar
echo 'java -Xmx512M -jar `dirname $0`/sbt-launch.jar "$@"' > sbt
chmod a+x sbt
sudo mv sbt-launch.jar sbt /usr/bin/

rm -r live-notes-server*
wget -O live-notes-server.tar.gz https://github.com/mconf/live-notes-server/tarball/master
tar xf live-notes-server.tar.gz
mv -i mconf-live-notes-server-* live-notes-server
touch live-notes-server.sh
echo '#!/bin/bash' >> live-notes-server.sh
CURRENT=`pwd`
echo "cd $CURRENT/live-notes-server" >> live-notes-server.sh
echo "sbt \"run 8095\"" >> live-notes-server.sh
chmod +x live-notes-server.sh
sudo mv live-notes-server.sh /usr/bin/

crontab -l | grep -v "live-notes-server.sh" > cron.jobs
echo "@reboot /usr/bin/live-notes-server.sh > /dev/null 2>&1 &" >> cron.jobs
crontab cron.jobs
rm cron.jobs

echo "The live notes server installation will be concluded when the server restarts"

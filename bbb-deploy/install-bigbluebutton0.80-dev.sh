Cac buoc cai dat BBB0.8 DEV

sudo video-conf --setup-dev tools

source ~/.profile

cd ~/dev

git clone https://github.com/quangquynh-bbb081/bigbluebutton

cd ~/dev/bigbluebutton

git status

git checkout -b my-bbb-branch v0.8

git status

cd 
sudo video-conf --setup-dev client

wget https://raw.github.com/mrquangquynh/installation-scripts/master/bbb-deploy/install-bigbluebutton0.80-dev_part1.sh
chmod +x install-bigbluebutton0.80-dev_part1.sh
./install-bigbluebutton0.80-dev_part1.sh


cd ~/dev/bigbluebutton/bigbluebutton-client
ant
ant locales

cd 

wget https://raw.github.com/mrquangquynh/installation-scripts/master/bbb-deploy/install-bigbluebutton0.80-dev_part2.sh
chmod +x install-bigbluebutton0.80-dev_part2.sh
./chmod +x install-bigbluebutton0.80-dev_part2.sh


sudo video-conf --setip IP or HOST:PORT

#Chuyển về BBB thường dùng   :
#              $   sudo ln -s -f /etc/bigbluebutton/nginx/client /etc/bigbluebutton/nginx/client.nginx
#              $   sudo /etc/init.d/nginx restart     
#Chuyển về BBB-dev : 
#              $  sudo ln -s -f /etc/bigbluebutton/nginx/client_dev /etc/bigbluebutton/nginx/client.nginx
#              $  sudo /etc/init.d/nginx restart  







































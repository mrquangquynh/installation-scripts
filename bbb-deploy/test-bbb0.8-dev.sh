
#!/bin/bash


#Cac buoc cai dat BBB0.8 DEV

bbb-conf --setup-dev tools

echo "------------source ~/.profile-----------------"

source ~/.profile

echo "------------git clone github.com/.../.../-----------------"


cd ~/dev

git clone https://github.com/bigbluebutton/bigbluebutton

echo "------------git status - checkout -----------------"

cd ~/dev/bigbluebutton

git checkout -b my-bbb-branch v0.8


bbb-conf --setup-dev client

echo "------------Build Flash -----------------"

cd ~/dev/bigbluebutton/bigbluebutton-client

ant

echo "------------Build langue -----------------"

ant locales

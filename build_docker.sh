sudo docker build -t nodejs:ss .
git clone https://bamachrn@bitbucket.org/krish_tech/krishtech_servicestation.git
sudo docker run -v `pwd`/krishtech_servicestation:/nodeApplication nodejs:ss /firstRun.sh

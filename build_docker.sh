mkdir -p nodeData
docker stop mariadb-server
docker rm mariadb-server
docker run --name mariadb-server -v `pwd`/nodeData:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=Service_Station -p 3306:3306 -d mariadb:5
cd nodeApp
docker build -t nodejs:ss .
cd ../
git clone https://bamachrn@bitbucket.org/krish_tech/krishtech_servicestation.git
cd krishtech_servicestation 
git checkout feature/lead
cd ../
docker run -it --link mariadb-server:mysql -v `pwd`/krishtech_servicestation/DB/service_station_all.sql:/service_station_all.sql --rm mariadb:5 sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" < /service_station_all.sql'
docker run -it --rm -v `pwd`/krishtech_servicestation:/nodeApplication nodejs:ss /firstRun.sh

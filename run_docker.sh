docker stop mariadb-server
docker rm mariadb-server
docker run --name mariadb-server -v `pwd`/nodeData:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mariadb:5
docker run -v `pwd`/krishtech_servicestation:/nodeApplication -p 9090:3000 nodejs:ss /runApp.sh

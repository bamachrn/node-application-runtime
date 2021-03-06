docker stop mariadb-server
docker rm mariadb-server
docker run --name mariadb-server -v `pwd`/nodeData:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mariadb:5
cd krishtech_servicestation
git pull origin development
sed -i s/127.0.0.1/`ip -4 route get 8.8.8.8|rev|cut -d " " -f2|rev|head -1`/g config/database.json
cd ../
docker run -it --rm -v `pwd`/krishtech_servicestation:/nodeApplication -p 3095:3095 nodejs:ss /runApp.sh

docker stop mariadb-server
docker rm mariadb-server
cd krishtech_servicestation
git pull origin development
docker run --name mariadb-server -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mariadb:5
sleep 20
docker run -it --link mariadb-server:mysql -v `pwd`/DB/ss_test_data.sql:/ss_test_data.sql --rm mariadb:5 sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -proot'
sed -i s/127.0.0.1/`ip -4 route get 8.8.8.8|rev|cut -d " " -f2|rev|head -1`/g config/database.json
grunt

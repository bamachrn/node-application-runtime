docker stop mariadb-server
docker rm mariadb-server
cd krishtech_servicestation
git pull origin development
cd ../
docker run --name mariadb-server -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=Service_Station -p 3306:3306 -d mariadb:5
docker run -it --link mariadb-server:mysql -v `pwd`/krishtech_servicestation/DB/ss_test_data.sql:/ss_test_data.sql --rm mariadb:5 sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" < /ss_test_data.sql'

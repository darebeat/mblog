#!/bin/sh

APP_NAME=mblog-latest.jar
APP_PATH=/app/mblog
BASE_PATH=$(cd `dirname $0`; pwd)

echo 'cd $BASE_PATH'

usage() {
    echo "Please select database type: "
    echo "-h         show help information"
    echo "--help     show help information"
    echo "mysql      start blog with mysql database"
    echo "h2         start blog with h2 database"
    echo "> sh docker-entrypoint.sh [ h2 or mysql ]"
    exit 1
}

h2(){
	java -jar /app/mblog/mblog-latest.jar
}

mysql(){
	spring_datasource_url=${spring_datasource_url:-"jdbc:mysql://${MYSQL_HOST}:${MYSQL_PORT}/${MYSQL_DATABASE}?useSSL=false&characterEncoding=utf8&serverTimezone=GMT%2B8"}
	spring_datasource_username=${spring_datasource_username:-"${MYSQL_USERNAME}"}
	spring_datasource_password=${spring_datasource_password:-"${MYSQL_PASSWORD}"}
	
	java -jar /app/mblog/mblog-latest.jar \
    -Dspring.datasource.url=${spring_datasource_url} \
    -Dspring.datasource.username=${spring_datasource_username} \
    -Dspring.datasource.password=${spring_datasource_password}
}

case "$1" in
	"h2")
		h2
		;;
	"mysql")
		mysql
		;;
	"--help")
		usage
		;;
	"-h")
		usage
		;;
	*)
    echo "It's not a valid param: $@"
    usage
    ;;
esac
#!/bin/bash

APP_NAME=mblog-latest.jar
APP_PATH=/app/mblog
BASE_PATH=$(cd `dirname $0`; pwd)

echo 'cd $BASE_PATH'

usage() {
    echo "select database type: sh docker-entrypoint.sh [ h2 or mysql ]"
    exit 1
}

h2(){
	java -jar /app/mblog/mblog-latest.jar
}

mysql(){
	spring_datasource_url="jdbc:mysql://${MYSQL_HOST}:${MYSQL_PORT}/${MYSQL_DATABASE}?useSSL=false&characterEncoding=utf8mb4&serverTimezone=GMT%2B8"
	spring_datasource_username="${MYSQL_USERNAME}"
	spring_datasource_password="${MYSQL_PASSWORD}"
	
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
	*)
    usage
    ;;
esac
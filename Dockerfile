FROM maven:3.5.4-jdk-8
MAINTAINER darebeat<darebeat@126.com>

WORKDIR /app/mblog
ADD . /build

ENV TZ=Asia/Shanghai

RUN cd /build && mvn package -Dmaven.test.skip=true -Pdocker \
    && cp -f target/mblog-latest.jar /app/mblog && rm -rf /build/*

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/mblog/mblog-latest.jar"]
FROM maven:3.6.3-ibmjava-8-alpine AS build
COPY pom.xml /build/pom.xml
COPY src /usr/src/app/src
WORKDIR /build
RUN mvn clean package -Dmaven.test.skip=true -Pdocker


FROM openjdk:8-jdk-alpine
MAINTAINER darebeat<darebeat@126.com>

COPY docker-entrypoint.sh /
COPY --from=build /build/target/mblog-latest.jar /app/mblog
ENV TZ=Asia/Shanghai
EXPOSE 8080
WORKDIR /app/mblog

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["sh", "-c"]
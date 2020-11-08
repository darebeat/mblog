FROM maven:3.6.3-ibmjava-8-alpine AS build
WORKDIR /build
COPY pom.xml /build/pom.xml
COPY src /build/src
RUN mvn clean package -Dmaven.test.skip=true -Pdocker


FROM openjdk:8-jdk-alpine
MAINTAINER darebeat<darebeat@126.com>

WORKDIR /app/mblog
COPY docker-entrypoint.sh /
COPY --from=build /build/target/mblog-latest.jar /app/mblog
ENV TZ=Asia/Shanghai
EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["sh", "-c"]
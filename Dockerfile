FROM openjdk:8-jdk-alpine
ARG JAR_FILE=build/libs/*.war
COPY ${JAR_FILE} mvn-hello-world.war

RUN mkdir destination-dir-for-add
ADD sample.tar.gz /destination-dir-for-add

ENTRYPOINT ["java","-jar","/mvn-hello-world.war"]

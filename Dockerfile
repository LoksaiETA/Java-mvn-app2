FROM openjdk:8
COPY target/mvn-hello-world.war /usr/src/mvn-hello-world.war
CMD java -war /usr/src/mvn-hello-world.war

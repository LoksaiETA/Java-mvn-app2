FROM tomcat:latest

COPY ./mvn-hello-world.war /usr/local/tomcat/webapps/


FROM tomcat:latest
WORKDIR /home/devopsadmin
COPY ./mvn-hello-world.war /usr/local/tomcat/webapps


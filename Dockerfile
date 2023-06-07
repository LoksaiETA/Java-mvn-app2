FROM tomcat:latest
workdir /home/devopsadmin
COPY ./mvn-hello-world.war /usr/local/tomcat/webapps/


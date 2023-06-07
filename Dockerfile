FROM tomcat:latest
wrokdir /home/devopsadmin
COPY ./mvn-hello-world.war /usr/local/tomcat/webapps/


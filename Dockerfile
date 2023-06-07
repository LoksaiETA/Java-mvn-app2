FROM tomcat:latest
workdir /home/devopsadmin/workspace/java-mvn-webapp/target
COPY ./mvn-hello-world.war /usr/local/tomcat/webapps/


FROM tomcat:latest

RUN cp /home/dockeradmin/*.war /usr/local/tomcat/webapps
COPY ./mvn-hello-world.war /usr/local/tomcat/webapps/


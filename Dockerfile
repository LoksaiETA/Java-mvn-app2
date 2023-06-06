FROM tomcat:latest
WORKDIR /home/devopsadmin/workspace/java-mvn-webapp/target
RUN cp /home/dockeradmin/*.war /usr/local/tomcat/webapps
COPY ./mvn-hello-world.war /usr/local/tomcat/webapps/


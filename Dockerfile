FROM tomcat:latest
WORKDIR /home/devopsadmin
COPY ./target/mvn-hello-world.war /usr/local/tomcat/webapps


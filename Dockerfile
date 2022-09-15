FROM tomcat:latest
COPY ./target/mvn-hello-world.war /usr/local/tomcat/webapps
RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps

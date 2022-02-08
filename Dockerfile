FROM tomcat:8.0-alpine
MAINTAINER Deepshikha
RUN app update
RUN app add wget
RUN wget —user=admin —password=Pa55word -O /usr/local/tomcat/webapps/sampleapplication.war http://localhost:8082/artifactory/deepshikha-nagp-repo-common/com/nagarro/devops-tools/devops/demosampleapplication/1.0.0-SNAPSHOT/demosampleapplication-1.0.0-SNAPSHOT.war
EXPOSE 9090
CMD /usr/local/tomcat/bin/catalina.sh run

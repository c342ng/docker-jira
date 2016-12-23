FROM  c3t3m3/docker-java:jdk8-oracle

RUN mkdir -p /data/jira && mkdir -p /opt/jira

RUN apt-get update -q && apt-get install -y wget curl vim \
  && apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin
RUN curl -Ls https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-7.2.6.tar.gz | \
  tar -xz --directory /opt/jira --strip-components=1
RUN curl -Ls https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.0.8.tar.gz | \
  tar -xz --directory "/opt/jira/lib/" --strip-components=1
RUN echo "jira.home =/data/jira" > "/opt/jira/atlassian-jira/WEB-INF/classes/jira-application.properties"

EXPOSE 8080

CMD ["sh","/opt/jira/bin/catalina.sh","run"]

FROM  c3t3m3/docker-java:jdk8-oracle
ENV CONF_HOME /var/jira
RUN apt-get update -q && apt-get install -y wget curl mysql-client \
  && apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin
RUN mkdir -p "${CONF_HOME}" \
  && curl -Ls https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-7.2.6.tar.gz | \
  tar -xz --directory "${CONF_HOME}" --strip-components=1
  
EXPOSE 8090
EXPOSE 8080

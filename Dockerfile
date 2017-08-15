
# Adapted from http://shashikantjagtap.net/get-started-with-brand-new-jenkins-2-0-with-docker/

FROM jenkins/jenkins:2.73
USER root
COPY docker-engine.key /tmp/docker-engine.key

RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins

run apt-get update && echo "deb https://apt.dockerproject.org/repo debian-stretch main" > /etc/apt/sources.list.d/docker.list \
    && apt-get install apt-transport-https && apt-key add /tmp/docker-engine.key && apt-get update && apt-get install -y docker-engine

USER jenkins
ENV JAVA_OPTS="-Xmx8192m -Dhudson.diyChunking=false -Dorg.apache.commons.jelly.tags.fmt.timeZone=America/Chicago -Duser.timezone=America/Chicago"

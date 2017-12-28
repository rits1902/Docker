FROM debian:stable

MAINTAINER Rodrigo Souza version: 0.1

ENV RDECK_BASE /var/lib/rundeck

RUN \
  echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list && \
  apt-get -y update && \
  apt-get -y install -t stretch-backports --no-install-recommends bash openjdk-8-jre-headless ca-certificates-java supervisor procps sudo ca-certificates openssh-client mysql-server mysql-client pwgen curl wget git uuid-runtime parallel && \
  wget http://dl.bintray.com/rundeck/rundeck-deb/rundeck-2.10.2-1-GA.deb && \
  dpkg -i rundeck-2.10.2-1-GA.deb  && \

ADD prerequisites/ /

RUN \
    chmod u+x /opt/entrypoint.sh &&\
    mkdir -p $RDECK_BASE/.ssh &&\
    chown rundeck:rundeck $RDECK_BASE/.ssh

# Start rundeck
ENTRYPOINT ["/opt/entrypoint.sh"]

EXPOSE 4440 4443

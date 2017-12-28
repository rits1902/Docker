FROM debian:stable

MAINTAINER Rodrigo Souza version: 0.1

ENV RDECK_BASE /var/lib/rundeck

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update &&\
    apt-get -qqy install apt-utils &&\
    apt-get -qqy install --no-install-recommends bash\
                                                 procps\
                                                 sudo\
                                                 ca-certificates\
                                                 openjdk-8-jdk\ 
                                                 openssh-client\
                                                 pwgen\
                                                 curl\
                                                 git\
                                                 uuid-runtime &&\
    apt-get clean

ADD http://dl.bintray.com/rundeck/rundeck-deb/rundeck-2.7.3-1-GA.deb /tmp/rundeck.deb

ADD prerequisites/ /

RUN dpkg -i /tmp/rundeck.deb &&\
    rm /tmp/rundeck.deb &&\
    chown rundeck:rundeck /tmp/rundeck &&\
    chmod u+x /opt/entrypoint.sh &&\
    mkdir -p $RDECK_BASE/.ssh &&\
    chown rundeck:rundeck $RDECK_BASE/.ssh

EXPOSE 4440 4443

# Start rundeck
ENTRYPOINT ["/opt/entrypoint.sh"]


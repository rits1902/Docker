#!/bin/bash

set -e

initfile=/etc/rundeck.init

chmod 1777 /tmp

#if [ ! -f "${initfile}" ]; then
#   SERVER_URL=${SERVER_URL:-"http://0.0.0.0:4440"}
#   HOST_DATABASE=${HOST_DATABASE:-"localhost"}
#   DATABASE_URL=${DATABASE_URL:-"jdbc:mysql://localhost/rundeckdb?autoReconnect=true"}
#   RUNDECK_DB_PASSWORD=${RUNDECK_PASSWORD:-$(pwgen -s 15 1)}
#   
#	if [ -z "$SERVER_URL" ]; then
#		echo "Preencher SERVER_URL"
#	else
#		sed -i 's,grails.serverURL\=.*,grails.serverURL\='${SERVER_URL}',g' /etc/rundeck/rundeck-config.properties
#	fi
#
#        if [ -z "$DATABASE_URL" ]; then
#                echo "Preencher DATABASE_URL para conexao de banco externa"
#        else
#                sed -i 's,dataSource.url = .*,dataSource.url = '${DATABASE_URL}',g' /etc/rundeck/rundeck-config.properties
#	  	 sed -i 's,dataSource.dbCreate.*,,g' /etc/rundeck/rundeck-config.properties
#                echo "dataSource.username = rundeck" >> /etc/rundeck/rundeck-config.properties
#                echo "dataSource.password = ${RUNDECK_DB_PASSWORD}" >> /etc/rundeck/rundeck-config.properties
#		 echo "create database `rundeckdb`" | mysql -h $HOST_DATABASE -uroot
#		 echo "grant replication all on *.* to rundeck@'%' identified by '${RUNDECK_DB_PASSWORD}';" | mysql -h $HOST_DATABASE -uroot 
#        fi
#fi

. /lib/lsb/init-functions
. /etc/rundeck/profile

PROCESS="rundeckd"
DAEMON="${JAVA_HOME:-/usr}/bin/java"
DAEMON_ARGS="${RDECK_JVM} -cp ${BOOTSTRAP_CP} com.dtolabs.rundeck.RunServer /var/lib/rundeck 4440"
rundeckd="$DAEMON $DAEMON_ARGS"

echo -n "Iniciando ${PROCESS}"
su -s /bin/bash rundeck -c "$rundeckd"

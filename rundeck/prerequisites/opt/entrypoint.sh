#!/bin/bash

set -e

initfile=/etc/rundeck.init

chmod 1777 /tmp

. /lib/lsb/init-functions
. /etc/rundeck/profile

PROCESS="rundeckd"
DAEMON="${JAVA_HOME:-/usr}/bin/java"
DAEMON_ARGS="${RDECK_JVM} -cp ${BOOTSTRAP_CP} com.dtolabs.rundeck.RunServer /var/lib/rundeck 4440"
rundeckd="$DAEMON $DAEMON_ARGS"

echo -n "Iniciando ${PROCESS}"
su -s /bin/bash rundeck -c "$rundeckd"

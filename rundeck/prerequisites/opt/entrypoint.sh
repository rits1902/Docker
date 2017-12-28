#!/bin/bash

prog="rundeckd"
DAEMON="${JAVA_HOME:-/usr}/bin/java"
DAEMON_ARGS="${RDECK_JVM} -cp ${BOOTSTRAP_CP} com.dtolabs.rundeck.RunServer /var/lib/rundeck 4440"
rundeckd="$DAEMON $DAEMON_ARGS"

echo -n "Starting ${prog}"
su -s /bin/bash rundeck -c "$rundeckd"

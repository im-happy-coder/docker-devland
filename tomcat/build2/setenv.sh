#! /bin/bash
JMX_OPTS=" -Dcom.sun.management.jmxremote \
-Dcom.sun.management.jmxremote.authenticate=false \
-Djava.rmi.server.hostname=$(hostname -i) \
-Dcom.sun.management.jmxremote.ssl=false "
CATALINA_OPTS=" ${JMX_OPTS} ${CATALINA_OPTS}"
export CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF8 -Duser.timezone=GMT+9"


COMPOSE_FILE_GITLAB=docker/docker-compose-gitlab.yml
COMPOSE_FILE_JENKINS=docker/docker-compose-jenkins.yml
COMPOSE_FILE_REDIS=docker/docker-compose-redis.yml
COMPOSE_FILE_MYSQL=docker/docker-compose-mysql.yml
COMPOSE_FILE_ORACLE=docker/docker-compose-oracle11g.yml
COMPOSE_FILE_TOMCAT=docker/docker-compose-tomcat.yml
COMPOSE_FILE_HTTPD=docker/docker-compose-httpd.yml

# . scripts/utils.sh

function composeUp() {
  COMPOSE_FILES="-f ${COMPOSE_FILE_GITLAB} ${COMPOSE_FILE_JENKINS} ${COMPOSE_FILE_REDIS} ${COMPOSE_FILE_MYSQL} ${COMPOSE_FILE_ORACLE} ${COMPOSE_FILE_TOMCAT} -f ${COMPOSE_FILE_HTTPD}"
  docker-compose ${COMPOSE_FILES} up -d 2>&1
  docker ps -a
  if [ $? -ne 0  ]; then
    fatalln "Unable to start compose"
  fi
}

function composeDown() {
  # docker-compose -f $COMPOSE_FILE_TOMCAT $COMPOST_FILE_HTTPD down --volumes --remove-orphans
  docker-compose -f $COMPOSE_FILE_TOMCAT $COMPOST_FILE_HTTPD down
}

# Parse Mode
if [[ $# -lt 1 ]]; then
  printHelp
  exit 0
else
  MODE=$1
  shift
fi

# Determine mode of opertaion and printing out what we asked for
if [ "$MODE" == "up" ]; then
  infoln "Starting..."
elif [ "$MODE" == "down" ]; then
  infoln "Stopping..."
else
  printHelp
  exit 1
fi

if [ "${MODE}" == "up" ]; then
  composeUp
elif [ "${MODE}" == "down" ]; then
  composeDown
else
  infoln "printHelp"
  exit 1
fi

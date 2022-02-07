SSH_SRC_DATA=/root/ssh
SSH_DEST_DATA=/root/.ssh

SSH_OPTS="-N"
SSH_OPTS="${SSH_OPTS} -o ServerAliveCountMax=3"
SSH_OPTS="${SSH_OPTS} -o ServerAliveInterval=20"
SSH_OPTS="${SSH_OPTS} -o ExitOnForwardFailure=yes"
SSH_OPTS="${SSH_OPTS} -R ${REMOTE_HOST}:${REMOTE_PORT}:${LOCAL_HOST}:${LOCAL_PORT}"

if [ ! -z ${IDENTITY_FILE} ]; then
  SSH_OPTS="-i ${SSH_DEST_DATA}/${IDENTITY_FILE} ${SSH_OPTS}"
fi

rm -rf ${SSH_DEST_DATA} \
  && mkdir ${SSH_DEST_DATA} \
  && cp -R ${SSH_SRC_DATA}/* ${SSH_DEST_DATA}/ \
  && chmod -R 600 ${SSH_DEST_DATA}/* \
  && ssh ${SSH_OPTS} ${DEST_USER}@${DEST_HOST} \
  && while true; do sleep 50; done;

SSH_SRC_DATA=/root/ssh
SSH_DEST_DATA=/root/.ssh

SSH_CMD_OPTIONS="-N -R ${REMOTE_HOST}:${REMOTE_PORT}:${LOCAL_HOST}:${LOCAL_PORT}"

if [ ! -z ${IDENTITY_FILE} ]; then
  SSH_CMD_OPTIONS="-i ${SSH_DEST_DATA}/${IDENTITY_FILE} ${SSH_CMD_OPTIONS}"
fi

rm -rf ${SSH_DEST_DATA} \
  && mkdir ${SSH_DEST_DATA} \
  && cp -R ${SSH_SRC_DATA}/* ${SSH_DEST_DATA}/ \
  && chmod -R 600 ${SSH_DEST_DATA}/* \
  && ssh ${SSH_CMD_OPTIONS} ${DEST_USER}@${DEST_HOST} \
  && while true; do sleep 50; done;

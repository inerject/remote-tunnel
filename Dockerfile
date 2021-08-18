FROM alpine
RUN apk add --no-cache openssh-client

ENTRYPOINT rm -rf /root/.ssh \
  && mkdir /root/.ssh \
  && cp -R /root/ssh/* /root/.ssh/ \
  && chmod -R 600 /root/.ssh/* \
  && ssh \
    -N \
    -R $REMOTE_HOST:$REMOTE_PORT:$LOCAL_HOST:$LOCAL_PORT $DEST_USER@$DEST_HOST \
  && while true; do sleep 50; done;

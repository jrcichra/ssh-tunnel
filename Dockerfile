FROM ubuntu:21.04
RUN apt update && apt install -y openssh-client && rm -rf /var/lib/apt/lists/*
VOLUME /root/.ssh
ENV SSH_PORT=22
CMD "/usr/bin/ssh -p ${SSH_PORT} -o ServerAliveInterval=60 -o ExitOnForwardFailure=yes -nNT -L 0.0.0.0:${LOCAL_PORT}:${REMOTE_ADDR}:${REMOTE_PORT} ${REMOTE_USER}@${REMOTE_HOST}"
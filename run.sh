#!/bin/bash
set -x
ssh -p ${SSH_PORT} -o ServerAliveInterval=60 -o ExitOnForwardFailure=yes -o StrictHostKeyChecking=no -nNT -L 0.0.0.0:${LOCAL_PORT}:${REMOTE_ADDR}:${REMOTE_PORT} ${REMOTE_USER}@${REMOTE_HOST}
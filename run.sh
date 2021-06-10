#!/bin/bash
ssh -p ${SSH_PORT} -o ServerAliveInterval=60 -o ExitOnForwardFailure=yes -nNT -L 0.0.0.0:${LOCAL_PORT}:${REMOTE_ADDR}:${REMOTE_PORT} ${REMOTE_USER}@${REMOTE_HOST}
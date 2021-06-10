FROM ubuntu:21.04
WORKDIR /src/app
VOLUME /root/.ssh
ENV SSH_PORT=22
RUN apt update && apt install -y openssh-client && rm -rf /var/lib/apt/lists/*
COPY run.sh .
CMD run.sh
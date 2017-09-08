FROM debian:jessie

LABEL maintainer="Yoann VANITOU <yvanitou@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get --yes install openssh-server rsync && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -vp /var/run/sshd

COPY ./ssh/* /etc/ssh/
COPY ./entrypoint.sh /

RUN chmod -v 600 /etc/ssh/*
RUN chmod -v 755 /entrypoint.sh

VOLUME /etc/ssh/

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]

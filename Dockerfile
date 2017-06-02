FROM debian:jessie

MAINTAINER Yoann Vanitou

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get --yes install openssh-server rsync && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -vp /var/run/sshd

COPY ./etc/ssh/sshd-users.conf /etc/ssh
COPY ./etc/ssh/sshd_config /etc/ssh
COPY ./entrypoint.sh /

VOLUME /etc/ssh/

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
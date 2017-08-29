FROM debian:jessie

LABEL maintainer="Yoann VANITOU <yvanitou@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get --yes install openssh-server rsync && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -vp /var/run/sshd

COPY ./ssh/* /etc/ssh
COPY ./entrypoint.sh /

VOLUME /etc/ssh/

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
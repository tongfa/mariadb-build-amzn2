FROM amazonlinux:2017.12 as base
MAINTAINER Chris David <ippadmin@sky.chrisdavid.com>
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin/:/bin

RUN yum -y update

# developer debuggin tools
RUN yum -y install telnet man psmisc procps

# general devel prereqs
RUN yum install -y gcc-c++ ncurses-devel git gnutls-devel

# build prereqs
RUN yum install -y cmake bison systemd-devel rpm-build libaio-devel openssl-devel checkpolicy policycoreutils policycoreutils-python

CMD /bin/bash

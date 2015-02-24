FROM ubuntu:14.04

MAINTAINER Andrea Grandi <andrea@thisisglow.com>

RUN apt-get update -y && \
apt-get install -y python-dev build-essential python-pip libcurl4-gnutls-dev python2.7-dev libpq-dev supervisor nfs-common git nginx libjpeg-dev npm nodejs-legacy python-dev build-essential python-pip python2.7-dev wget unzip openjdk-6-jre git ruby nginx && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* && \
groupadd -g 1001 glowconsole && \
useradd -m -s /bin/bash -u 1001 -g 1001 glowconsole
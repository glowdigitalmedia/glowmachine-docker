# This Dockerfile builds a complete development ennvironment for GlowMachine

FROM ubuntu:14.04

MAINTAINER Andrea Grandi <andrea@thisisglow.com>

# Install basic Ubuntu packages for development

RUN apt-get update -y
RUN apt-get install -y python-dev build-essential python-pip libcurl4-gnutls-dev rabbitmq-server wget python2.7-dev

# PostgreSQL

RUN apt-get install -y postgresql postgresql-contrib postgresql-server-dev-9.3
USER postgres
RUN  /etc/init.d/postgresql start &&\
    psql --command "CREATE USER glowmachine WITH SUPERUSER PASSWORD 'glowmachine';" &&\
    createdb -O glowmachine glowmachine
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf
EXPOSE 5432

# MongoDB

USER root
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list
RUN apt-get update
RUN apt-get install -y -q mongodb-org
RUN mkdir -p /data/db

# Google API libraries

WORKDIR /tmp/
RUN wget https://google-api-ads-python.googlecode.com/files/dfa_api_python_2.3.1.tar.gz
RUN tar xzvf dfa_api_python_2.3.1.tar.gz
WORKDIR /tmp/dfa_api_python_2.3.1/
RUN python setup.py build install

WORKDIR /tmp/
RUN wget https://google-api-ads-python.googlecode.com/files/dfa_api_python_2.3.1.tar.gz
RUN tar xzvf dfa_api_python_2.3.1.tar.gz
WORKDIR /tmp/dfa_api_python_2.3.1/
RUN python setup.py build install

# Manual installation of some legacy Python libraries from pip
RUN pip install --allow-external PIL --allow-unverified PIL PIL==1.1.7
RUN pip install --allow-external argparse --allow-unverified argparse argparse==1.2.1

# Install all the required Python packages from pip repository

ADD requirements.txt /opt/glowmachine/
WORKDIR /opt/glowmachine/
RUN pip install -r requirements.txt

# Startup script

ADD run.sh /root/
RUN chmod +x /root/run.sh
ENTRYPOINT ["/root/run.sh"]

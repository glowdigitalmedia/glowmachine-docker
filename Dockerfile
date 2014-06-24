# This Dockerfile builds a complete development ennvironment for GlowMachine

FROM ubuntu:14.04

MAINTAINER Andrea Grandi <andrea@thisisglow.com>

# Install basic Ubuntu packages for development

RUN apt-get update -y
RUN apt-get install -y python-dev build-essential python-pip

# Install all the required Python packages from pip repository

ADD requirements.txt /opt/glowmachine/
WORKDIR /opt/glowmachine/
RUN pip install -r requirements.txt

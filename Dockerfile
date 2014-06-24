# This Dockerfile builds a complete development ennvironment for GlowMachine

FROM ubuntu:14.04

MAINTAINER Andrea Grandi <andrea@thisisglow.com>

RUN apt-get update -y
RUN apt-get install -y python-dev build-essential

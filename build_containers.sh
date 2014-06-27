#!/bin/bash
docker build -rm=true -t "andreagrandi/glowmachine-dev:ubuntu" ubuntu/
docker build -rm=true -t "andreagrandi/glowmachine-dev:mongo" mongo/
docker build -rm=true -t "andreagrandi/glowmachine-dev:postgresql" postgresql/
docker build -rm=true -t "andreagrandi/glowmachine-dev:web" web/

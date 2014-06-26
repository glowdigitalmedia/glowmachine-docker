#!/bin/bash
docker build -t "andreagrandi/glowmachine-dev:mongo" mongo/
docker build -t "andreagrandi/glowmachine-dev:postgresql" postgresql/
docker build -t "andreagrandi/glowmachine-dev:web" web/

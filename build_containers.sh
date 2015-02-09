#!/bin/bash
docker build -rm=true -t "glow/glowmachine-mongo:latest" mongo/
docker build -rm=true -t "glow/glowmachine-postgresql:latest" postgresql/

#!/bin/bash

# Create a folder that containers will use to store persistent data
mkdir -p $HOME/gm-data/

# Start MongoDB
docker run -d -P -v $HOME/gm-data/:/data/db andreagrandi/glowmachine-dev:mongo

# Start PostgreSQL
docker run -d -P -v $HOME/gm-data/:/var/lib/postgresql/9.3/main andreagrandi/glowmachine-dev:postgresql

# Start web stack
docker run -i -P -t -v `pwd`:/glowcode andreagrandi/glowmachine-dev:web /bin/bash

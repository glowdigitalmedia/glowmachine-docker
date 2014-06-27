#!/bin/bash

# Start MongoDB
docker run -d -P --volumes-from mongodata andreagrandi/glowmachine-dev:mongo

# Start PostgreSQL
docker run -d -P --volumes-from postgresdata andreagrandi/glowmachine-dev:postgresql

# Start web stack
docker run -i -P -t -v `pwd`:/glowcode andreagrandi/glowmachine-dev:web /bin/bash

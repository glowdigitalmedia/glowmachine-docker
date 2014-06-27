#!/bin/bash

# Create data container for MongoDB
docker run -d -v /data/db --name mongodata andreagrandi/glowmachine-dev:ubuntu /bin/bash

# Create data container for MongoDB
docker run -d -v /var/lib/postgresql/9.3/main --name postgresdata andreagrandi/glowmachine-dev:ubuntu /bin/bash

#!/bin/bash

case "$1" in
    start)
        # Start MongoDB
        echo "Starting MongoDB container..."
        docker run --name mongo -d -P --volumes-from mongodata andreagrandi/glowmachine-dev:mongo

        # Start PostgreSQL
        echo "Starting PosgreSQL container..."
        docker run --name postgres -d -P --volumes-from postgresdata andreagrandi/glowmachine-dev:postgresql

        # Start web stack
        echo "Starting web container..."
        docker run --name web --link mongo:mongo --link postgres:postgres -i -P -t -v `pwd`:/glowcode andreagrandi/glowmachine-dev:web /bin/bash
        ;;
    stop)
        echo "Stopping web container..."
        docker stop web
        echo "Removing web container..."
        docker rm web
        echo "Stopping MongoDB container..."
        docker stop mongo
        echo "Removing MongoDB container..."
        docker rm mongo
        echo "Stopping PostgreSQL container..."
        docker stop postgres
        echo "Stopping PostgreSQL container..."
        docker rm postgres
        ;;
    setup)
        echo "Setting up MongoDB data container..."
        docker run -d -v /data/db --name mongodata andreagrandi/glowmachine-dev:ubuntu /bin/bash
        echo "Setting up PostgreSQL data container..."
        docker run -d -v /var/lib/postgresql/9.3/main --name postgresdata andreagrandi/glowmachine-dev:ubuntu /bin/bash
        ;;
*)
    echo $"Usage: $0 {start|stop|setup}"
    exit 1
esac
exit 0

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
        docker run --name web --link mongo:mongo -i -P -t -v `pwd`:/glowcode andreagrandi/glowmachine-dev:web /bin/bash
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
*)
    echo $"Usage: $0 {start|stop}"
    exit 1
esac
exit 0

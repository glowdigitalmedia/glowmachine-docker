To rebuild the image:

    docker build --force-rm=true --rm=true --tag="glow/memcached:latest" .
    
To push the image:

    docker push glow/memcached:latest

To run the service:

    fig up

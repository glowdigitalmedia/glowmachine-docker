This is the common base image for the backend and frontend containers.


To rebuild the image:

    docker build --force-rm=true --rm=true --tag="glow/memcached:latest" .

To run the service:

    fig up


To push the image:

    docker push glow/glowbase:latest

To rebuild the image:

    docker build --force-rm=true --rm=true --tag="glow/mongodb:latest" .

To push the image:

    docker push glow/mongodb:latest

To run the service:

    fig up

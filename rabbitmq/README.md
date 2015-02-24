To rebuild the image:

    docker build --force-rm=true --rm=true --tag="glow/rabbitmq:latest" .
    
To push the image:

    docker push glow/rabbitmq:latest

To run the service:

    fig up

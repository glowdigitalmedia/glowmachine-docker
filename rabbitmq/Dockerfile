FROM ubuntu:14.04

MAINTAINER Andrea Grandi <andrea@thisisglow.com>

# Add RabbitMQ repository
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list

# Install curl needed to get the PGP key
RUN apt-get install -y curl

# Add RabbitMQ PGP key
RUN curl http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add -

# Install RabbitMQ
RUN apt-get update -y && apt-get install -y rabbitmq-server

# Enable RabbitMQ Management Console
RUN rabbitmq-plugins enable rabbitmq_management

# Configure default queue and user
# Note: we need to start the service during Docker image creation to be able to call rabbitmqctl
RUN service rabbitmq-server start && \
    rabbitmqctl add_vhost glowmachine && \
    rabbitmqctl add_user glowmachine glowcon99 && \
    rabbitmqctl set_permissions -p glowmachine  glowmachine ".*" ".*" ".*" && \
    service rabbitmq-server stop

EXPOSE 5672
EXPOSE 15672

CMD ['rabbitmq-server']

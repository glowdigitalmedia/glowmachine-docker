FROM ubuntu:14.04

MAINTAINER Andrea Grandi <andrea@thisisglow.com>

# Install PGP key
RUN apt-key adv --keyserver pool.sks-keyservers.net --recv-keys F78372A06FF50C80464FC1B4F7B8CEA6056E8E56

# Add RabbitMQ repository
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list

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

CMD ["rabbitmq-server"]

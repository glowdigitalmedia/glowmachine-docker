FROM ubuntu:14.04

MAINTAINER Andrea Grandi <andrea@thisisglow.com>

# Add RabbitMQ repository
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list

# Add RabbitMQ PGP key
RUN curl http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add -

# Install RabbitMQ
RUN apt-get update -y && apt-get install -y rabbitmq-server

# Enable RabbitMQ Management Console
RUN rabbitmq-plugins enable rabbitmq_management

# Configure default queue
RUN rabbitmqctl add_vhost glowmachine
RUN rabbitmqctl add_user glowmachine glowcon99
RUN rabbitmqctl set_permissions -p glowmachine  glowmachine ".*" ".*" ".*"

EXPOSE 5672
EXPOSE 15672

CMD ['rabbitmq-server']

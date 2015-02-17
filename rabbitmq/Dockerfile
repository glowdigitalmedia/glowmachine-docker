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

COPY run.sh /root/run.sh
RUN chmod +x /root/run.sh

EXPOSE 5672
EXPOSE 15672

CMD ["/root/run.sh"]

FROM ubuntu:14.04

MAINTAINER Andrea Grandi <andrea@thisisglow.com>

# Install RabbitMQ
RUN apt-get update -y && apt-get install -y memcached

# Add memuser user to run the service with
RUN groupadd -g 1001 memuser
RUN useradd -m -s /bin/bash -u 1001 -g 1001 memuser

# Expose the Memcached default port
EXPOSE 11211

# Entry point to run memcached in foreground
CMD ["memcached", "-u", "memuser"]

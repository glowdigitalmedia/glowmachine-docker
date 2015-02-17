#!/bin/bash
service rabbitmq-server start
rabbitmqctl add_vhost glowmachine
rabbitmqctl add_user glowmachine glowcon99
rabbitmqctl set_permissions -p glowmachine  glowmachine ".*" ".*" ".*"
service rabbitmq-server stop
rabbitmq-server

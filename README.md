#glowmachine-docker



Dockerfile to create a container with all the environment needed for development of the GlowMachine.

**Note:** images for PostgreSQL, MongoDB, Memcached and RabbitMQ will be automatically rebuilt by docker.io hub and pushed to glow/\<servicename\>:latest

## Salt
Install salt using the [salt bootstrap][salt-bootstrap] script.

#### Installation for Mac
If you're on a Mac you can install by [following the official mac install instructions][mac-install-instructions].

brew install https://raw.github.com/cobrateam/formulae/master/swig.rb

## Useful commands
To connec to a running image call `glow-glowmachine-ui`:

    sudo docker exec -i -t glow-glowmachine-ui /bin/bash

[salt-bootstrap]: https://github.com/saltstack/salt-bootstrap#examples
[mac-install-instructions]: http://docs.saltstack.com/en/latest/topics/tutorials/walkthrough_macosx.html#step-1-configuring-the-salt-master-on-your-mac

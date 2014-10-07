glowmachine-docker
==================

Sets of [Docker](https://www.docker.com/whatisdocker/) images for various purpose, for example:
- Isolated development environmet for running tests and experimenting with GlowMachine code
- Componentized execution stack (in progress so far)

[Vagrant](http://docs.vagrantup.com/v2/why-vagrant/index.html) support (treating Docker as provider) is provided. The basic support for removing images and containers using `Makefile` is added as well.

Prerequisites
-------------

To use Vagrant make sure that the next conditions are met:
- [Vagrant 1.6.3](https://www.vagrantup.com/download-archive/v1.6.3.html) - it should work on earlier versions as well, but it lower boundary is still to be defined.
- Make sure that you rid off images or containers you created using regular scripts (`build_containers.sh` and `gm-env.sh`). Vagrants tracks information about images and contaniers it creates and will complan about name conflicts if any of them exists before first use. Run:
```
$ make rm; make rmi
  
```
to achieve that.
- Make sure that repository `glowmachine` resides in adjacent directory.

Quick start
-----------

To start isolated environment fire:
```
$ vagrant up --provider=docker --no-parallel
```
You must supply `--provider=docker` key or make sure that environment variable `VAGRANT_DEFAULT_PROVIDER` is set to `docker`. It takes for a while to build all containers upon first start.

The `web` imaged is turned into micro virtual machine and and primary, so you can easily access it using `ssh` after start:
```
$ vagrant ssh

```
You will be brought into `/root` directory with `glowcode` mounted in it. Feel free to do whatever you want from there (running tests, starting backend application, etc).

You an run tests ourside of container as well:
```
$ make test
```

To know general status use:
```
$ vagrant status
```

To stop all containers:
```
$ vagrant halt
```

Roadmap
-------
- Add `glowcode-ui` image
- Add set of images representing componentized execution environment
- Finish `Makefile`

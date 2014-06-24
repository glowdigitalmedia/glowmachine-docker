#!/bin/bash
/etc/init.d/postgresql start
mongod &
/bin/bash

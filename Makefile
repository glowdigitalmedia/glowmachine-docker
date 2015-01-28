
.PHONY: rm rm-all rm-postgresql rm-mongo rm-web rm-postgresdata rm-mongodata rm-database
.PHONY: rmi rmi-all rmi-postgresql rmi-mongo rmi-web rmi-database
.PHONY: test

# Build images
# TODO

# Remobe containsers
rm:	rm-all

rm-all: rm-postgresql rm-mongo rm-web rm-postgresdata rm-mongodata rm-database

rm-postgresql:
	-docker rm postgres

rm-mongo:
	-docker rm mongo

rm-web:
	-docker rm web

rm-postgresdata:
	-docker rm postgresdata

rm-mongodata:
	-docker rm mongodata

rm-database:
	-docker rm database

# Remove images
rmi:	rmi-all

rmi-all: rmi-postgresql rmi-mongo rmi-web rmi-database

rmi-postgresql:
	-docker rmi andreagrandi/glowmachine-dev:postgresql

rmi-mongo:
	-docker rmi andreagrandi/glowmachine-dev:mongo

rmi-web:
	-docker rmi andreagrandi/glowmachine-dev:web

rmi-database:
	-docker rmi andreagrandi/glowmachine-dev:ubuntu

# Start containers
# TODO

# Stop containers
# TODO

# Misc stuff
test:
	vagrant ssh -c "(cd glowcode/glowconsole; ./manage.py test --settings=settings_test)"

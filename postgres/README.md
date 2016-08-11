# Build the OOI Postgres Docker image

The base postgres image needs PostGIS installed for uframe
to function. As such, you will need a modified dockerfile.

You can create multiple versions of postgres containers by
just updating the version string in the first line. The initdb-ooi.sh
script takes care of creating the database/user on first run.

To build:

```
$ docker build -t ooi-postgres:9.2 .
```

To test:

```
$ docker run  --name posttest -p 127.0.0.1:5432:5432 -d ooi-postgres:9.2
```

We exposed the 5432 port for postgres, so we will be able to
connect to the container with psql:

```
$ psql -h localhost metadata awips
psql (9.5.1, server 9.2.17)
Type "help" for help.

metadata=>
```
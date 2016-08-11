# Running a complete OOI system using docker compose

1. Build the QPID, Postgres, Ingest Engine and Stream Engine images
2. Build a cassandra data directory with all OOI tables defined
3. Start everything with docker-compose

The docker-compose.yml file here exposes several volumes allowing us to interact
with various parts of the OOI system:

* async - output directory for async data requests
* cassandra_data - database files for cassandra
* ingest_data - input directory for data files to be ingested
  * copy files here prior to sending a request for ingestion
* ooi - input directory for uframe (asset management spreadsheets, qc sheets, etc.)


## Configuring Cassandra

Prior to starting uframe we need to create a cassandra database directory
populated with our desired tables. This can be accomplished by starting up
a temporary cassandra container with an exposed data directory, then creating
our keyspace and tables. The temporary container can then be destroyed and the
data directory moved to the compose volume mount point. This directory can also
be archived between tests, then unpacked to create a clean, pre-configured
cassandra for each test/test group.

```
$ docker run -p 127.0.0.1:9042:9042 --name cassload -v $(pwd)/cassandra_data:/var/lib/cassandra cassandra:2.1.11
```

Docker will start up a new cassandra container. When cassandra is ready to
accept connections you will see the following message:

```
INFO  16:31:09 Starting listening for CQL clients on /0.0.0.0:9042...
INFO  16:31:09 Binding thrift service to /0.0.0.0:9160
INFO  16:31:09 Listening for thrift clients...
```

You can then create the keyspace and OOI tables using cqlsh:

```
$ cqlsh --cqlversion=3.2.1 < all.cql
```

The all.cql script can be found in the uframe source under util/cql.

Once the table creation is complete, we can stop the cassload container and remove it:

```
$ docker stop cassload
$ docker rm cassload
```

If you archive the cassandra_data folder now you can bypass these steps for
subsequent runs which don't require updates to any cassandra tables.


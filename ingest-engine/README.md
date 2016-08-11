# Building the Ingest Engine docker image

1. Copy or clone the ingest engine repo into this folder (as ingest_engine)
2. $ docker build -t ooi-ingest-engine:0.01 .

This image exports a single directory (/data) which can be used
to provide a location where files to be processed can be placed to
be made available to ingest engine to process.

# Building the Stream Engine docker image

1. Copy or clone the stream engine repo into this folder (as stream_engine)
2. $ docker build -t ooi-stream-engine:0.01 .

This image exports a single directory (/data) which can be used
to provide a location where files to be processed can be placed to
be made available to ingest engine to process.

#!/bin/bash

sed -i 's/CASSANDRA_CONTACT_POINTS.*/CASSANDRA_CONTACT_POINTS = ["cassandra"]/g' stream_engine/config.py
sed -i 's;ANNOTATION_URL.*;ANNOTATION_URL = "http://uframe:12580/annotations/find/";g' stream_engine/config.py
sed -i 's;ASSET_URL.*;ASSET_URL = "http://uframe:12573";g' stream_engine/config.py
sed -i 's;ASSET_HOST.*;ASSET_HOST = "uframe";g' stream_engine/config.py
sed -i 's;STREAM_METADATA_SERVICE_URL.*;STREAM_METADATA_SERVICE_URL = "http://uframe:12571/streamMetadata";g' stream_engine/config.py
sed -i 's;PARTITION_METADATA_SERVICE_URL.*;PARTITION_METADATA_SERVICE_URL = "http://uframe:12571/partitionMetadata";g' stream_engine/config.py
sed -i 's/workers = .*/workers = 2/g' stream_engine/gunicorn_config.py

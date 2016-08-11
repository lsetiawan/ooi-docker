#!/bin/sh

sed -i 's/workers = .*/workers = 2/g' ingest_engine/gunicorn_config.py
sed -i 's/SERVER_NAME = "localhost:5001"//g' ingest_engine/config.py

#!/bin/bash

sed -i 's/workers = .*/workers = 2/g' stream_engine/gunicorn_config.py
sed -i 's/INFO/DEBUG/g' stream_engine/logging.conf

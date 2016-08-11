#!/bin/sh

set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# Create metadata database and awips user
"${psql[@]}" <<- 'EOSQL'
CREATE DATABASE metadata template=template_postgis;
CREATE USER awips WITH PASSWORD 'awips';
GRANT ALL PRIVILEGES ON DATABASE metadata TO awips;

\connect metadata
CREATE SCHEMA awips AUTHORIZATION awips;
CREATE SCHEMA events AUTHORIZATION awips; 
EOSQL

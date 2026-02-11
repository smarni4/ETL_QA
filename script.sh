#!/bin/bash

TARGET_DIR="/Users/veera/Desktop/Data Engineer/Sainath/ETL_QA"

cd "$TARGET_DIR" || { echo "Directory not found: $TARGET_DIR"; exit 1; }

# Optional: clean up if already exists
docker rm -f olist-pg >/dev/null 2>&1 || true


echo "$PWD"

docker run --name olist-pg -e POSTGRES_PASSWORD=postgres   -p 5432:5432 -d postgres:16

until docker exec olist-pg pg_isready -U postgres >/dev/null 2>&1; do
  sleep 1
done


docker ps

docker exec -it olist-pg mkdir -p /tmp/etl/sql_files/ /tmp/etl/data_files/

docker exec -it olist-pg  psql -U postgres -c "CREATE DATABASE olist;"


docker cp ./sql_files/  olist-pg:/tmp/sql_files/


docker cp ./data_files/ olist-pg:/tmp/data_files/ 


docker exec -it olist-pg psql -U postgres -d olist -f /tmp/sql_files/staging_tables.sql -f /tmp/sql_files/data_load.sql



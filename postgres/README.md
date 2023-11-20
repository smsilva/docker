# PostgreSQL Image

## Usage

```bash
export PGUSER="postgres"
export PGPASSWORD="postgres"
export PGDATABASE="postgres"
export PGPORT="5432"

docker run \
  --name psql \
  -it \
  --rm \
  --env PGUSER=${PGUSER?} \
  --env PGPASSWORD=${PGUSER?} \
  --env PGDATABASE=${PGDATABASE?} \
  --env PGPORT=${PGPORT?} \
  psql:latest \
    --host localhost \
    --port 5432 \
    --dbname ${PGDATABASE?} \
    --username ${PGUSER?}

docker run \
   -it \
   --rm \
   psql:latest \
     --version
```


### psql

```bash
export PGPASSWORD="postgres"

psql \
  --host localhost \
  --port 5432 \
  --dbname postgres \
  --username postgres

```
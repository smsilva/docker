# Metabase

## Start

```bash
source env.conf

docker compose up -d

docker compose logs -f
```

## Accessing Metabase

- Open your web browser and go to `http://localhost:3000`


## Cleanup

```bash
docker compose down --volumes
```

### DELETE ALL DATA

```bash
sudo rm -rf mysql
```

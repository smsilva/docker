# mongoshell Image

## 1. Build using mongosh specific version

```bash
./build 2.3.2
```

## 2. Connection string

```bash
export MONGODB_HOST=""
export MONGODB_DATABASE_NAME=""
export MONGODB_USERNAME=""
export MONGODB_PASSWORD=""
```

```bash
export MONGODB_PASSWORD_URL_ENCODED=$(printf %s "${MONGODB_PASSWORD?}" | jq -sRr @uri)
export MONGODB_CONNECTION_STRING_MONGODB_ATLAS="mongodb+srv://${MONGODB_USERNAME?}:${MONGODB_PASSWORD_URL_ENCODED}@${MONGODB_HOST?}/${MONGODB_DATABASE_NAME?}?readPreference=secondaryPreferred&readPreferenceTags=workloadType:OPERATIONAL&retryWrites=true&w=majority&maxStalenessSeconds=90&maxIdleTimeMS=1500000&appName=mongoshell&minPoolSize=10"
export MONGODB_CONNECTION_STRING_COSMOSDB_FOR_MONGODB="mongodb://${MONGODB_USERNAME?}:${MONGODB_PASSWORD_URL_ENCODED}@${MONGODB_HOST?}/?ssl=true&retrywrites=false&replicaSet=globaldb&maxIdleTimeMS=120000&appName=@${MONGODB_USERNAME?}@"

# Azure CosmosDB for MongoDB
docker run \
  --rm \
  --env MONGODB_CONNECTION_STRING=${MONGODB_CONNECTION_STRING_COSMOSDB_FOR_MONGODB?} \
  mongoshell:latest \
    --debug 1

# Mongo Atlas
docker run \
  --rm \
  --env MONGODB_CONNECTION_STRING=${MONGODB_CONNECTION_STRING_MONGODB_ATLAS?} \
  mongoshell:latest \
    --debug 1
```

## 3. Default

```bash
docker run \
  --rm \
  --env MONGODB_HOST=${MONGODB_HOST?} \
  --env MONGODB_DATABASE_NAME=${MONGODB_DATABASE_NAME?} \
  --env MONGODB_USERNAME=${MONGODB_USERNAME?} \
  --env MONGODB_PASSWORD=${MONGODB_PASSWORD?} \
  mongoshell:latest \
    --debug 1
```

## 4. Custom command

```bash
docker run \
  --rm \
  --env MONGODB_HOST=${MONGODB_HOST?} \
  --env MONGODB_DATABASE_NAME=${MONGODB_DATABASE_NAME?} \
  --env MONGODB_USERNAME=${MONGODB_USERNAME?} \
  --env MONGODB_PASSWORD=${MONGODB_PASSWORD?} \
  mongoshell:latest \
    --command 'printjson(db.accounts.find( { "account_id": 702610 } ))'
```

## 5. TCP Ping

```bash
docker run \
  --rm \
  --entrypoint /opt/scripts/tcpping \
  mongoshell:latest \
    -d -x 5 google.com 443
```

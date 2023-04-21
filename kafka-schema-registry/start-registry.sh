#!/bin/bash -e

if [[ -z "$SCHEMA_REGISTRY_HOST_NAME" ]]; then
	export SCHEMA_REGISTRY_HOST_NAME=$(hostname)
fi

if [[ -z "$SCHEMA_REGISTRY_KAFKASTORE_BOOTSTRAP_SERVERS" ]]; then
	export SCHEMA_REGISTRY_KAFKASTORE_BOOTSTRAP_SERVERS="PLAINTEXT://127.0.0.1:9092"
fi

if [[ -z "$SCHEMA_REGISTRY_LISTENERS" ]]; then
	export SCHEMA_REGISTRY_LISTENERS="http://0.0.0.0:8081"
fi

if [[ -z "$SCHEMA_REGISTRY_LEVEL" ]]; then
	export SCHEMA_REGISTRY_LEVEL="full"
fi

export SCHEMA_REGISTRY_PROPERTIES=/usr/local/confluent/etc/schema-registry/schema-registry.properties

echo "listeners="$SCHEMA_REGISTRY_LISTENERS > temp.properties
echo "kafkastore.bootstrap.servers="$SCHEMA_REGISTRY_KAFKASTORE_BOOTSTRAP_SERVERS >> temp.properties
echo "kafkastore.topic=_schemas" >> temp.properties
echo "schema.compatibility.level="$SCHEMA_REGISTRY_LEVEL >> temp.properties

cp temp.properties $SCHEMA_REGISTRY_PROPERTIES

tail -f /dev/null
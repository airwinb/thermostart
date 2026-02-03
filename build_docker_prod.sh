#!/bin/bash
version=$1
docker_user_name=$2
echo "version: ${version}"
echo "docker_user_name: ${docker_user_name}"

if [[ -n "$version" ]]; then
    docker compose -f docker-compose.prod.yml build --no-cache --build-arg TS_SERVER_VERSION="${version}"
    docker tag thermostart-web:latest thermostart-web:"${version}"
    if [[ -n "docker_user_name" ]]; then
        docker tag thermostart-web:latest "${docker_user_name}"/thermostart-web:"${version}"
    fi
else
    echo "Usage: build_docker_prod.sh <version> [docker_user_name]"
fi

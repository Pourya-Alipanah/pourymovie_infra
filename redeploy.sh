#!/bin/bash

set -e

SERVICES=(
  "traefik/traefik.yml"
  "db/docker-compose.yml"
  "minio/docker-compose.yml"
  "portainer/docker-compose.yml"
  "backend/docker-compose.yml"
  "frontend/docker-compose.yml"
)

for svc in "${SERVICES[@]}"; do
  echo "Stopping service defined in $svc"
  docker compose -f $svc down
done

for svc in "${SERVICES[@]}"; do
  echo "Starting service defined in $svc"
  docker compose -f $svc up -d --build --force-recreate
done

#!/bin/bash
docker compose --file platform/docker-compose.yaml up --build --remove-orphans --detach

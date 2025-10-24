#!/bin/bash
cd /home/father/n8n-docker-caddy
echo "$(date): Pulling latest images..." >> n8n.log
docker compose pull
echo "$(date): Taking down application for update..." >> n8n.log
docker compose down --remove-orphans
echo "$(date): Running image and build cache cleanup..." >> n8n.log
docker image prune --force >> n8n.log 2>&1
docker builder prune --force >> n8n.log 2>&1
echo "$(date): Bringing application up with new images..." >> n8n.log
docker compose up -d
echo "$(date): Update and cleanup complete." >> n8n.log

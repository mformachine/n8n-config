#!/bin/bash
cd /home/user/n8n-docker-caddy
echo "$(date): Pulling latest images..." >> n8n.log
docker compose pull
echo "$(date): Taking down application for update/cleanup..." >> n8n.log
docker compose down
echo "$(date): Running safe system prune..." >> n8n.log
docker system prune -a --force >> n8n.log 2>&1
echo "$(date): Bringing application up with new images..." >> n8n.log
docker compose up -d
echo "$(date): Update and cleanup complete." >> n8n.log

#!/bin/bash
set -euo pipefail

# Paths
cd /srv/paperworld-wiki
CERTS_PATH="/etc/letsencrypt"
WEBROOT_PATH="/srv/paperworld-wiki/nginx/html"
NGINX_CONTAINER_ID="$(docker compose ps -q nginx)"

# If nginx container is empty, exit.
[ -n "$NGINX_CONTAINER_ID" ] || { echo "nginx not running"; exit 1; }

# Run certbot renewal
docker run --rm \
  -v "$CERTS_PATH:/etc/letsencrypt" \
  -v "$WEBROOT_PATH:/usr/share/nginx/html" \
  -v /var/log/letsencrypt:/var/log/letsencrypt \
  certbot/certbot renew --webroot -w /usr/share/nginx/html

# Reload nginx if renewal succeeded
docker exec "$NGINX_CONTAINER_ID" nginx -s reload

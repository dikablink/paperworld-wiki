#!/bin/bash

# Paths
CERTS_PATH="/srv/paperworld-wiki/nginx/certs"
WEBROOT_PATH="/srv/paperworld-wiki/nginx/html"
NGINX_CONTAINER="ubuntu_nginx_1"

# Run certbot renewal
docker run --rm \
  -v "$CERTS_PATH:/etc/letsencrypt" \
  -v "$WEBROOT_PATH:/usr/share/nginx/html" \
  certbot/certbot renew --webroot -w /usr/share/nginx/html

# Reload nginx if renewal succeeded (it touches cert files)
docker exec "$NGINX_CONTAINER" nginx -s reload

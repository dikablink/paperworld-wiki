#!/usr/bin/env bash
set -euo pipefail

# Call generateSitemap.php within MediaWiki container
docker compose exec -T mediawiki php /var/www/html/maintenance/generateSitemap.php \
  --server=https://wiki.anarkadia.net \
  --fspath=/data/sitemap \
  --urlpath=/sitemap
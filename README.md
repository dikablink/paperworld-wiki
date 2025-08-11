# Paperworld Wiki - README

Paperworld Wiki is a Dockerized MediaWiki 1.39.13 stack for "The Paper World".
It uses Nginx (TLS termination + reverse proxy), a custom MediaWiki image (PHP 8.1),
and MySQL 5.7. Configuration is managed via docker-compose and environment variables.
PHP runtime overrides are applied via an additional conf.d directory using
PHP_INI_SCAN_DIR (overlay), so base INIs are not masked.

## Architecture

- nginx       : Serves /wiki/* and proxies /w/* to MediaWiki; handles HTTPS.
- mediawiki   : Custom MediaWiki image; required PHP extensions (e.g., intl).
- db          : MySQL 5.7 with persistent Docker volume.

## Content

Visit the site at [https://wiki.anarkadia.net/](https://wiki.anarkadia.net/wiki/)

- [Planned Outline](https://wiki.anarkadia.net/wiki/Paper_World_Outline)
- [Completed Outline](https://wiki.anarkadia.net/wiki/Paper_World_Completed_Outline)
- [Special:Version](https://wiki.anarkadia.net/wiki/Special:Version)

## License

This repository contains deployment/configuration for the Paperworld Wiki.
MediaWiki is GPL-licensed by the Wikimedia Foundation.

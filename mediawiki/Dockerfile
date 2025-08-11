# --- Build vendors for extensions/skins with Composer ---
FROM composer:2 AS extbuild
ENV COMPOSER_ALLOW_SUPERUSER=1
WORKDIR /app

# Bring in your extension/skin sources from the repo
COPY extensions/ ./extensions/
COPY skins/ ./skins/

# Install composer deps where needed via composer.json files
RUN set -eux; \
    find extensions skins -mindepth 1 -maxdepth 2 -type f -name composer.json -print0 \
    | xargs -0 -I{} sh -c 'cd "$(dirname "{}")" && composer install --no-dev --prefer-dist --no-progress --optimize-autoloader'

# --- Final image based on upstream MediaWiki ---
FROM mediawiki:1.39.13

# Copy extensions/skins *after* composer build so vendors come along
RUN rm -rf /var/www/html/extensions /var/www/html/skins
COPY --from=extbuild --chown=www-data:www-data /app/extensions /var/www/html/extensions
COPY --from=extbuild --chown=www-data:www-data /app/skins      /var/www/html/skins

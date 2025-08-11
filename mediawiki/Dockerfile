FROM mediawiki:1.39

# Set upload sizes based on default.conf
RUN { \
  echo 'upload_max_filesize=100M'; \
  echo 'post_max_size=100M'; \
  echo 'memory_limit=256M'; \
} > /usr/local/etc/php/conf.d/uploads.ini

# Logs directory from LocalSettings.php
RUN mkdir -p /var/www/html/logs && chown -R www-data:www-data /var/www/html/logs

# Bring in your LocalSettings (compose will still bind-mount it; this is a sane default)
COPY --chown=www-data:www-data LocalSettings.php /var/www/html/LocalSettings.php

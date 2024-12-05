# Configura permisos para el directorio translations de Drupal
RUN mkdir -p /var/www/html/sites/default/files/translations && \
    chown -R www-data:www-data /var/www/html/sites/default/files/translations && \
    chmod -R 755 /var/www/html/sites/default/files/translations

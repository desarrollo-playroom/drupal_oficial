# Usa una imagen base de PHP con Apache
FROM php:8.1-apache

# Habilita mod_rewrite (necesario para Drupal)
RUN a2enmod rewrite

# Configura ServerName para evitar advertencias en Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Copia los archivos del proyecto al contenedor
COPY . /var/www/html

# Configura permisos para el directorio translations de Drupal
RUN mkdir -p /var/www/html/sites/default/files/translations && \
    chown -R www-data:www-data /var/www/html/sites/default/files/translations && \
    chmod -R 755 /var/www/html/sites/default/files/translations

# Expone el puerto 80
EXPOSE 80

# Arranca Apache
CMD ["apache2-foreground"]

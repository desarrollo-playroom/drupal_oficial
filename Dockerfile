# Usa una imagen base de PHP con Apache
FROM php:8.1-apache

# Instala las extensiones necesarias para Drupal con PostgreSQL
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip unzip git \
    vim \
    postgresql-client && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd opcache pdo pdo_pgsql

# Habilita mod_rewrite (necesario para Drupal) y PHP
RUN a2enmod rewrite

# Configura ServerName para evitar advertencias en Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Copia los archivos del proyecto al contenedor
COPY . /var/www/html

# Configura permisos para Drupal
RUN chown -R www-data:www-data /var/www/html/sites/default/files \
    && chmod -R 755 /var/www/html/sites/default/files

# Crea el directorio translations si no existe
RUN mkdir -p /var/www/html/sites/default/files/translations && \
    chown -R www-data:www-data /var/www/html/sites/default/files/translations && \
    chmod -R 755 /var/www/html/sites/default/files/translations

# Expone el puerto 80
EXPOSE 80

# Arranca Apache
CMD ["apache2-foreground"]

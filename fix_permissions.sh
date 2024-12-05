#!/bin/bash

# Directorio de Drupal (ajusta esto si tu instalación está en un subdirectorio)
DRUPAL_ROOT="."

# Asegúrate de que el script se ejecuta desde el directorio correcto
cd $DRUPAL_ROOT

# Crea el directorio de traducciones si no existe
mkdir -p sites/default/files/translations

# Configura los permisos correctos
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;

# Asegúrate de que los directorios importantes sean escribibles
chmod 775 sites/default/files
chmod 775 sites/default/files/translations

# Si estás usando un servidor web diferente, cambia www-data por el usuario apropiado
# Por ejemplo, para XAMPP en Windows, podrías omitir esta línea
# Para MAMP en Mac, usa _www:_www en lugar de www-data:www-data
chown -R www-data:www-data sites/default/files

echo "Permisos actualizados correctamente."


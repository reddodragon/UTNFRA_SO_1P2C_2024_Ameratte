#!/bin/bash

# Definir la ruta del archivo de salida
ruta=~/repogit/UTNFRA_SO_1P2C_2024_Ameratte/RTA_ARCHIVOS_Examen_20241007/Filtro_Avanzado.txt


# Obtener la IP pública
ip_publica=$(curl -s ifconfig.me)

# Obtener el nombre de usuario
usuario=$(whoami)

# Obtener el hash del usuario
hash_usuario=$(sudo grep "^$usuario:" /etc/shadow | awk -F ':' '{print $2}')

# Obtener la URL del repositorio
url_repositorio=$(git remote get-url origin)

# Crear o sobrescribir el archivo de salida
{
  echo "Mi IP Publica es: $ip_publica"
  echo "Mi usuario es: $usuario"
  echo "El hash de mi usuario es: $hash_usuario"
  echo "La URL de mi repositorio es: $url_repositorio"
} > "$ruta"

echo "Se creo el archivo"

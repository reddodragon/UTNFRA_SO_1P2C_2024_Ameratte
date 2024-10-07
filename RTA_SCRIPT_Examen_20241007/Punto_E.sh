
#!/bin/bash

# Definir la ruta del archivo de salida
ruta=~/repogit/UTNFRA_SO_1P2C_2024_Ameratte/RTA_ARCHIVOS_Examen_20241007/Filtro_Basico.txt

# Obtener el total de memoria RAM
total_ram=$(grep -i '^MemTotal' /proc/meminfo | awk '{print $2, $3}')

# Obtener el fabricante del chasis
chassis_manufacturer=$(sudo dmidecode -t chassis)

# Crear o sobrescribir el archivo de salida
echo "MemTotal: $total_ram" > "$ruta"
echo "Chassis Information: $chassis_manufacturer" >> "$ruta"

echo "El archivo se creo correctamente"

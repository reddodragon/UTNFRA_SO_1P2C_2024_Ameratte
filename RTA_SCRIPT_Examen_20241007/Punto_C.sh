#!/bin/bash

# Crear grupos si no existen
sudo groupadd -f p1c2_2024_gAlumno
sudo groupadd -f p1c2_2024_gProfesores

# Obtener el hash de la contraseña de vagrant
password_hash=$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')

# Mostrar el hash
echo "El hash de la contraseña de vagrant es: $password_hash"

# Crear usuarios y agregar al grupo correspondiente
for i in {1..3}; do
    sudo useradd -m -G p1c2_2024_gAlumno -p "$password_hash" "p1c2_2024_A$i"
done

# Crear el usuario para profesores
sudo useradd -m -G p1c2_2024_gProfesores -p "$password_hash" p1c2_2024_P1

# Crear las carpetas necesarias
sudo mkdir -p ~/prueba_A/Examenes-UTN/{alumno_1,alumno_2,alumno_3,profesores}

# Cambiar la propiedad y permisos de alumno_1
sudo chown p1c2_2024_A1:p1c2_2024_gAlumno ~/prueba_A/Examenes-UTN/alumno_1
sudo chmod -R 750 ~/prueba_A/Examenes-UTN/alumno_1

# Cambiar la propiedad y permisos de alumno_2
sudo chown p1c2_2024_A2:p1c2_2024_gAlumno ~/prueba_A/Examenes-UTN/alumno_2
sudo chmod -R 760 ~/prueba_A/Examenes-UTN/alumno_2

# Cambiar la propiedad y permisos de alumno_3
sudo chown p1c2_2024_A3:p1c2_2024_gAlumno ~/prueba_A/Examenes-UTN/alumno_3
sudo chmod -R 700 ~/prueba_A/Examenes-UTN/alumno_3

# Cambiar la propiedad y permisos de profesores
sudo chown p1c2_2024_P1:p1c2_2024_gProfesores /home/vagrant/prueba_A/Examenes-UTN/profesores
sudo chmod -R 770 /home/vagrant/prueba_A/Examenes-UTN/profesores

# Crear los archivos validar.txt para cada alumno en la carpeta correspondiente
for i in {1..3}; do
    sudo -u "p1c2_2024_A$i" sh -c "whoami > /home/vagrant/prueba_A/Examenes-UTN/alumno_$i/validar.txt"
done

# Crear el archivo validar.txt para el profesor y guardarlo en el home de vagrant
sudo -u p1c2_2024_P1 sh -c "whoami > /home/vagrant/prueba_A/Examenes-UTN/profesores/validar.txt"

# Mensaje final
echo "Archivos validar.txt creados correctamente en /home/vagrant."

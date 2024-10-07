#!/bin/bash


echo "Particiono el disco: /dev/sdc."
echo

sudo fdisk /dev/sdc  << EOF
n
e
4


n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n


w
EOF
echo
echo "Particiones creadas."
sudo fdisk -l /dev/sdc
echo
echo "Formateo las particiones: "

for i in {5..14};
do
        sudo mkfs.ext4 /dev/sdc$i
done
echo
echo "Monto las particiones: "
for i in {5..13};
do
    for j in {1..3};
    do
	    numalu=$j
	    for x in {1..3};
        do
        echo "/dev/sdc$i ~/prueba_A/Examenes-UTN/alumno_$numalu/parcial_$x ext4 defaults 0 0" | sudo tee -a /etc/fstab

        sudo mount /dev/sdc$i ~/prueba_A/Examenes-UTN/alumno_$numalu/parcial_$x
done
        done
    done
done

echo"/dev/sdc14 ~/prueba_A/Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab

sudo mount /dev/sdc14 ~/prueba_A/Examenes-UTN/profesores

echo
echo "Valido montaje: "
df -h | grep ~/Examenes-UTN



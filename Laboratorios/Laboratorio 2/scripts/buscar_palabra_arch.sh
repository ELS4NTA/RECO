#!bin/bash
# Integrantes: Angie Mojica Daniel Santanilla
# Se debe entregar un path ej: /etc
# Se debe entregar un nombre/parte de arhcivo ej: .txt - ejemplo.txt
# Se debe entregar una completitud/parte de una palabra ej: conf - configuration
path=$1
nom_arch=$2
palabra=$3
# Busqueda de arhivo(s) en el path dado
archivos=$(find $path -iname "*$nom_arch*")
# Por cada archivo, busqueda de la palabra y cantidad de sus repeticiones
for linea in $archivos; do
    # Este comando busca las palabras indicadas -n para numero de lineas
    cantidad=$(grep -no $palabra $linea | wc -l) # -o para las palabras exactas
    if [ $cantidad -ne 0 ]; then # Solo los archivos que contienen la palabra
        echo "====> ARCHIVO: " $linea "<====="
        grep -no $palabra $linea
        echo "La cantidad de veces que se repitio (" $palabra "): " $cantidad
    fi
done

#!bin/bash
# Integrantes: Angie Mojica Daniel Santanilla
# Se debe entregar un path ej: /etc
# Se debe entregar un nombre/parte de arhcivo ej: .txt - ejemplo.txt
path=$1
nom_arch=$2
# Busca nombre/parte de un arhcivo dada la ruta, ignorando los casos con mayusculas
find $path -type f -iname "*$nom_arch*"
cantidad=$(find $path -type f -iname "*$nom_arch*" | wc -l)
echo "Cantidad de archivos encontrados: " $cantidad

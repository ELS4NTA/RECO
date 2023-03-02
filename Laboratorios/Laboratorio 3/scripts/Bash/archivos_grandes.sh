#!bin/bash
# Integrantes: Angie Mojica - Daniel Santanilla
# Script que lista los n archivos mas pequeNos en un tamaNo
# dado por el usuario; con posibilidad para filtrar por nombres.
directorio_arranque=$1
cantidad_archivos=$2 # Numero de archivos a listar
tam_max=$3 # TamaNo en MiB 
nombre_arch=$4 # Nombre de archivo a buscar en la lista
clear
if [ -z "$nombre_arch" ]; then
    echo -e "Archivo(s) encontrado(s):\n"
    find $directorio_arranque -type f -size "-${tam_max}c" | head -n $cantidad_archivos
else
    echo -e "Archivo(s) con el nombre" $nombre_arch "encontrado(s):\n"
    find $directorio_arranque -type f -size "-${tam_max}c" -iname "*${nombre_arch}*" | \
    head -n $cantidad_archivos
fi

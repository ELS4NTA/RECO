#!bin/bash
# Integrantes: Angie Mojica Daniel Santanilla
# Se debe entregar un nombre/parte de arhcivo ej: .txt - ejemplo.txt
# Se debe entregar una completitud/parte de una palabra ej: conf - configuration
nom_archivo=$1
palabra=$2
# Este comando busca las palabras indicadas -n para numero de lineas
# -o para las palabras exactas
grep -no $palabra $nom_archivo
cantidad=$(grep -no $palabra $nom_archivo | wc -l)
echo "La cantidad de veces que se repitio: " $cantidad

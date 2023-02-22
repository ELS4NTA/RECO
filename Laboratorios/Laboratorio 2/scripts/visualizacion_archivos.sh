#!bin/bash
# Integrantes: Angie Mojica Daniel Santanilla
# Se debe entregar la ruta del archivo ej: /home/ejemplo.txt
archivo=$1
while true; do
    echo "Menu"
    echo "1. Cantidad de lineas del archivo"
    echo "2. Repeticion de una palabra"
    echo "3. Finalizar"
    read -p "Ingresa tu opcion: " valor
    case $valor in
    1)
        echo "Cantidad de lineas de" $archivo "es:"
        echo $(less $archivo | wc -l)
    ;;
    2)
        read -p "Ingresa tu palabra: " palabra
        repeticiones=$(grep -o $palabra $archivo | wc -l)
        echo "La palabra (" $palabra ") se repite" $repeticiones "veces."
    ;;
    3)
        break
    ;;
    esac
done
#!bin/bash
# Integrantes: Angie Mojica - Daniel Santanilla
# Script donde se ejecuta un menu con opciones para los procesos
# ejecuntandose en el sistema.
clear
while true; do
    echo "=================> MENU <================="
    echo "1. Ver los procesos que estan corriendo."
    echo "2. Buscar un proceso."
    echo "3. Finalizar un proceso."
    echo "4. Finalizar menu."
    echo "=========================================="
    read -p "Ingresa tu opcion: " valor
    case $valor in
        1)
            # Lista los procesos por ID, %CPU, %Mem, COMMAND
            echo "Proceso(s) ejecutandose:"
            ps aux | awk '{print $2, "  ", $3 "  ", $4 "  ", $11}' | less
        ;;
        2)
            read -p "Nombre del proceso: " psnombre
            echo "Proceso(s) encontrado(s):"
            ps aux | head -n 1
            ps aux | grep $psnombre
        ;;
        3)
            read -p "Nombre del proceso: " psnombre
            psID=$(ps | grep $psnombre | awk '{print $1}')
            kill -9 $psID
            echo "Proceso $process_name finalizado."
        ;;
        4)
            break
        ;;
        *)
            echo "Opcion no valida."
        ;;
    esac
done

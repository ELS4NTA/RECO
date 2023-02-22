#!/bin/bash
# Integrantes: Angie Mojica, Daniel Santanilla
# Se debe entregar un path ej: /etc
path=$1
while true; do
    echo "Menu"
    echo "1. Ordenar por caracteristicas"
    echo "2. Ordenar por condiciones"
    echo "3. Finalizar"
    read -p "Ingresa tu opcion: " valor
    case $valor in
        1)
            echo "1. Ordenar archivos por mas reciente"
            echo "2. Ordenar archivos por mas antiguo"
            echo "3. Ordenar archivos de mayor a menor tamaNo"
            echo "4. Ordenar archivos de menor a mayor tamaNo"
            echo "5. Ordenar archivos por tipo"
            read -p "Ingresa tu opcion: " submenu
            case $submenu in
                1)
                    clear
                    ls -l -t $path | less
                    files=$(ls -t $path)
                    file=$(ls -t $path | head -n 2 | tail -n 1)
                    pastDate=$(stat -t "%D" $path'/'$file | awk '{ print $9 }')
                    count=1
                    for file in $files; do
                        newDate=$(stat -t "%D" $path'/'$file | awk '{ print $9 }')
                        if [ "$pastDate" = "$newDate" ]; then
                            count=$((count + 1))
                        else
                            echo "La cantidad de archivo(s) con la fecha" $pastDate "es" $count
                            count=1
                            pastDate=$newDate
                        fi
                    done
                ;;
                2)
                    clear
                    ls -lr -t $path
                    files=$(ls -r -t $path)
                    file=$(ls -r -t $path | head -n 2 | tail -n 1)
                    pastDate=$(stat -t "%D" $path'/'$file | awk '{ print $9 }')
                    count=1
                    for file in $files; do
                        newDate=$(stat -t "%D" $path'/'$file | awk '{ print $9 }')
                        if [ "$pastDate" = "$newDate" ]; then
                            count=$((count + 1))
                        else
                            echo "La cantidad de archivo(s) con la fecha" $pastDate "es" $count
                            count=1
                            pastDate=$newDate
                        fi
                    done
                ;;
                3)
                    clear
                    ls -Sl $path
                    files=$(ls -S $path)
                    file=$(ls -S $path | head -n 2 | tail -n 1)
                    pastSize=$(stat -c%s $path'/'$file)
                    count=1
                    for file in $files; do
                        newSize=$(stat -c%s $path'/'$file)
                        if [ $pastSize -eq $newSize ]; then
                            count=$((count + 1))
                        else
                            echo "La cantidad de archivo(s) con el tamaño" $pastSize "es" $count
                            count=1
                            pastSize=$newSize
                        fi
                    done
                ;;
                4)
                    clear
                    ls -Slr $path
                    files=$(ls -Sr $path)
                    file=$(ls -Sr $path | head -n 2 | tail -n 1)
                    pastSize=$(stat -c%s $path'/'$file)
                    count=1
                    for file in $files; do
                        newSize=$(stat -c%s $path'/'$file)
                        if [ $pastSize -eq $newSize ]; then
                            count=$((count + 1))
                        else
                            echo "La cantidad de archivo(s) con el tamaño" $pastSize "es" $count
                            count=1
                            pastSize=$newSize
                        fi
                    done
                ;;
                5)
                    ls -lX $path 
                ;;
            esac
        ;;
        2)
            echo "1. Mostrar archivos que inicien con una cadena dada"
            echo "2. Mostrar archivos que terminen con una cadena dada"
            echo "3. Mostrar archivos que contenga una cadena dada"
            read -p "Ingresa tu opcion: " submenu2
            case $submenu2 in
                1)
                    clear
                    read -p "Ingrese la cadena:" cadena
                    ls $cadena* 
                ;;
                2)
                    clear
                    read -p "Ingrese la cadena:" cadena
                    ls *$cadena 
                ;;
                3)
                    clear
                    read -p "Ingrese la cadena:" cadena
                    ls *$cadena*
                ;;
            esac
        ;;
        3)
            break
        ;;
    esac
done
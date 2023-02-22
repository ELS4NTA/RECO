#!/bin/bash
# Integrantes: Angie Mojica, Daniel Santanilla
# Se el numero n ej: 1
clear
cant=$1
while true; do
	echo "Menu"
	echo "1. Mostrar las n primeras y ultimas lineas de archivo log"
	echo "2. Mostrar n lineas del archivo que contengan una palabra"
    echo "3. Finalizar"
    read -p "Ingresa tu opcion: " valor
    case $valor in
        1)
            echo "Del log /var/log/messages las primeras" $cant "lineas son"
            less /var/log/messages | head -n $cant
            echo "Del log /var/log/messages las ultimas" $cant "lineas son"
            less /var/log/messages | tail -n $cant
            echo "Del log /var/log/syslog las primeras" $cant "lineas son"
            less /var/log/syslog | head -n $cant
            echo "Del log /var/log/syslog las ultimas" $cant "lineas son"
            less /var/log/syslog | tail -n $cant
            echo "Del log /var/log/maillog las primeras" $cant "lineas son"
            less /var/log/maillog | head -n $cant
            echo "Del log /var/log/maillog las ultimas" $cant "lineas son"
            less /var/log/maillog | tail -n $cant
        ;;
        2)
            read -p "Ingresa la palabra: " word
            echo "Del log /var/log/messages con la palabra(" $word ")en las primeras" $cant "lineas son"
            less /var/log/messages | head -n $cant | grep $word
            echo "Del log /var/log/messages con la palabra(" $word ")en las ultimas" $cant "lineas son"
            less /var/log/messages | tail -n $cant | grep $word
            echo "Del log /var/log/syslog con la palabra(" $word ")en las primeras" $cant "lineas son"
            less /var/log/syslog | head -n $cant | grep $word
            echo "Del log /var/log/syslog con la palabra(" $word ")en las ultimas" $cant "lineas son"
            less /var/log/syslog | tail -n $cant | grep $word
            echo "Del log /var/log/maillog con la palabra(" $word ")en las primeras" $cant "lineas son"
            less /var/log/maillog | head -n $cant | grep $word
            echo "Del log /var/log/maillog con la palabra(" $word ")en las ultimas" $cant "lineas son"
            less /var/log/maillog | tail -n $cant | grep $word
        ;;
        3)
            break
        ;;
    esac
done
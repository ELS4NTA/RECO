#!bin/bash
# Integrantes: Angie Mojica Daniel Santanilla
# 1. ifconfig
# 2. netstat
# 3. ping
# 4. mtr

while true; do
    echo "Menu"
    echo "1. Configurar una interfaz de red"
    echo "2. Conexiones de red/estadisticas. Ver estado de todas las interfaces"
    echo "3. Probar una conexion de red enviando n paquetes"
    echo "4. Diagnostico de red. Informe Traceroute"
    echo "5. Finalizar"
    read -p "Ingrese una opcion: " valor
    case $valor in
    1)
        read -p "Ingrese la interfaz : " interfaz
        echo "Submenu"
        echo "1. Apagar la interfaz indicada"
        echo "2. Activar la interfaz indicada"
        echo "3. Visualizar configuracion de interfaces"
        read -p "Ingrese una opcion: " valor1
        case $valor1 in
        1)
            ifconfig $interfaz down
        ;;
        2)
            ifconfig $interfaz up
        ;;
        3)
            ifconfig
        ;;
        esac
    ;;
    2)
        netstat -r
    ;;
    3)
        read -p "Ingresa el destino_host: " addressI
        read -p "Numero de paquetes: " number
        ping -c $number $addressI
    ;;
    4)
        read -p "Ingresa el destino_host: " addressII
        traceroute $addressII
    ;;   
    5)
        break
    ;;
    esac
done
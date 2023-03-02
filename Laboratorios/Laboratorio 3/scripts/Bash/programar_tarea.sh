#!bin/bash
# Integrantes: Angie Mojica - Daniel Santanilla
# Script para configurar una tarea que se ejecuta 
# periodicamente en el sistema

# * * * * * command
# Significado de los (*)
# 5*. Dia de la semana (0 - 7)
# 4*. Mes (1 - 12)
# 3*. Dia del mes (1 - 31)
# 2*. Hora (0 - 23)
# 1*. Minutos (0 - 59)
nombre_tarea=$1 # Path del script 
periodicidad=$2 # Dada en minutos

echo "$periodicidad * * * * $nombre_tarea" | crontab -

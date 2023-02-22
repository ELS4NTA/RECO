#!bin/bash
# Integrantes: Angie Mojica Daniel Santanilla
# Se debe entregar el nombre de un grupo ej: sistemas - ventas
# Se debe entregar el id del grupo valores mayes a 1000 ej: 1111
nombre_grupo=$1
ID_grupo=$2
# Creacion del grupo
groupadd $nombre_grupo --gid $ID_grupo

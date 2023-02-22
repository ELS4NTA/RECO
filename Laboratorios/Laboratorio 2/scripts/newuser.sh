#!bin/bash
# Integrantes: Angie Mojica Daniel Santanilla
# Creacion del usuario
nombre=$1 # Se da el nombre ej: Angie - Daniel
grupo=$2 # Se da el nombre del grupo ej: sistemas
descripcion=$3 # Descripcion entre comillas ej: "Esta es una descripcion"
directorio=$4 # El directorio se da desde la raiz ej: /home
shell=$5 # El shell se da desde la raiz ej: /bin/bash
#Permisos
permiso_usuario=$6
permiso_grupo=$7
permiso_otros=$8
if [ $(grep $shell /etc/shells)  = "$shell" ]; then
    useradd -md $directorio'/'$nombre $nombre
    usermod -g $grupo $nombre
    usermod -c $descripcion $nombre
    usermod -s $shell $nombre
    chmod $permiso_usuario$permiso_grupo$permiso_otros $directorio'/'$nombre
    passwd $nombre
    clear
    if [ $(grep $nombre /etc/passwd | cut -d: -f1) = "$nombre" ] ; then
        echo "Usuario creado exitosamente."
    else
        echo "No se pudo crear el usuario."
    fi
else
    clear
    echo "El shell no existe o no esta instalado, no se puede crear el usuario."
fi

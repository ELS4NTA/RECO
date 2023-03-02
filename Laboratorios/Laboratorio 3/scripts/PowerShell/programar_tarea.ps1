# Integrantes: Angie Mojica - Daniel Santanilla
<#
  Script para configurar una tarea que se ejecuta 
  periodicamente en el sistema
#>
param(
    [Parameter()]
    [String]$nombre_tarea, # Path del script | aplicacion
    [String]$periodicidad # Formato "yyyy-MM-dd HH:mm:ss"
)
# Crear la tarea
$nombre = Split-Path -Path $nombre_tarea -Leaf -Resolve
$disparador = New-ScheduledTaskTrigger -Daily -At $periodicidad
$accion = New-ScheduledTaskAction -Execute $nombre_tarea

# Registrar la tarea
Register-ScheduledTask -TaskName $nombre -Trigger $disparador -Action $accion

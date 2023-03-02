# Integrantes: Angie Mojica - Daniel Santanilla
<#
  Script que lista los n archivos mas pequeNos en un tamaNo
  dado por el usuario; con posibilidad para filtrar por nombres.
#>
param(
    [Parameter()]
    [String]$directorio_arranque,
    [String]$cantidad_archivos,
    [String]$tam_max, # Tamano en bytes 
    [String]$nombre_arch
)
Clear-Host
if ($nombre_arch -eq "") {
    Write-Host "Archivo(s) encontrado(s):"
    Get-ChildItem -Path $directorio_arranque -Recurse |
    Where-Object {$_.Length -lt $tam_max} |
    Select-Object -First $cantidad_archivos
} else {
    Write-Host "Archivo(s) con el nombre $nombre_arch encontrado(s):"
    Get-ChildItem -Path $directorio_arranque -Filter "*$nombre_arch*" -Recurse | 
    Where-Object {$_.Length -lt $tam_max} | 
    Select-Object -First $cantidad_archivos
}

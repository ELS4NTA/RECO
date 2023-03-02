# Integrantes: Angie Mojica - Daniel Santanilla
<#
  Script donde se ejecuta un menu con opciones para los procesos
  ejecuntandose en el sistema.
#>
Clear-Host
while ($true) {
    Write-Host "=================> MENU <================="
    Write-Host "1. Ver los procesos que estan corriendo."
    Write-Host "2. Buscar un proceso."
    Write-Host "3. Finalizar un proceso."
    Write-Host "4. Finalizar menu."
    Write-Host "=========================================="
    $option = Read-Host "Ingresa tu opcion"
    switch ($option) {
        1 {
            Write-Host "Proceso(s) ejecutandose:"
            Get-Process | Format-Table -AutoSize -Property ID, ProcessName, CPU, WorkingSet
        }
        2 {
            $process_name = Read-Host "Nombre del proceso"
            if (Get-Process -Name $process_name -ErrorAction SilentlyContinue) {
                Write-Host "Proceso(s) encontrado(s):"
                Get-Process -Name $process_name | Format-Table -AutoSize
            }
            else {
                Write-Host "Proceso $process_name no encontrado."
            }
        }
        3 {
            $process_name = Read-Host "Nombre del proceso"
            if (Get-Process -Name $process_name -ErrorAction SilentlyContinue) {
                Stop-Process -Name $process_name
                Write-Host "Proceso $process_name finalizado."
            }
            else {
                Write-Host "Proceso $process_name no encontrado."
            }
        }
        4 {
            exit
        }
        default {
            Write-Host "Opcion no valida"
        }
    }
}

# Integrantes: Angie Mojica - Daniel Santanilla
<#
  Script donde se ejecuta un menu con opciones para conocer
  informacion de red
#>
Clear-Host
while ($true) {
    Write-Host "=================> MENU <================="
    Write-Host "1. Obtener datos de la configuracion de Red."
    Write-Host "2. Mostrar tablas de conversion de direcciones Ip en direcciones fisicas."
    Write-Host "3. Rastrear una ruta a un host."
    Write-Host "4. Probar una conexion de red enviando n paquetes"
    Write-Host "5. Finalizar menu."
    Write-Host "=========================================="
    $option = Read-Host "Ingresa tu opcion"
    switch ($option) {
        1 {
          Write-Host "=================> SUBMENU <================="
          Write-Host "1. Direcciones IPv4 configuradas"
          Write-Host "2. Mostrar descripciones de cada adaptador de red."
          $valor1 = Read-Host "Ingresa tu opcion"
          switch ($valor1) {
            1 {
               ipconfig | Select-String "IPv4"
            }
            2 {
               ipconfig /all | Select-String "Description"
            }
          }  
        }
        2 {
           arp /a
        }
        3 {
           $hostRute = Read-Host "Ingresa el destino-Host"
           tracert $hostRute
        }
        4 {
            $addressH = Read-Host "Ingresa el destino_Host"
            $number = Read-Host "Ingresa el numero de Paquetes"
            ping -n $number $addressH
        }
        5 {
            exit
        }
        default {
            Write-Host "Opcion no valida"
        }
    }
}
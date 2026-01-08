#!/bin/bash

# 1. Solicitar una IP al servidor DHCP
#echo "Solicitando IP del servidor DHCP en red_servicios..."
#dhclient -r eth0 && dhclient -v eth0
#echo "Proceso DHCP completado."
#echo "-------------------------------------"

# 2. Iniciar el servidor Apache en primer plano
# httpd-foreground es el comando recomendado para ejecutar Apache en Docker
echo "Iniciando Apache httpd..."
httpd-foreground

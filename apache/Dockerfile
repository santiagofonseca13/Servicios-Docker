# Usamos la imagen oficial de Apache httpd como base
FROM httpd:latest

# 1. Instalar el cliente DHCP y las herramientas de red
# La imagen de httpd está basada en Debian, por lo que usamos apt-get
RUN apt-get update && apt-get install -y \
    isc-dhcp-client \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*

# 2. Copiar nuestro script de inicio y darle permisos de ejecución
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# 3. Exponer el puerto 80
EXPOSE 80

# 4. El comando de inicio será nuestro script personalizado
CMD ["/usr/local/bin/start.sh"]

# Dockerfile para Servidor DHCP ISC
FROM ubuntu:20.04

RUN apt-get update && apt-get install -y isc-dhcp-server iproute2

COPY dhcpd.conf /etc/dhcp/dhcpd.conf

# Crear el archivo de leases vacío para evitar errores
RUN touch /var/lib/dhcp/dhcpd.leases

RUN echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server

EXPOSE 67/udp

CMD ["/usr/sbin/dhcpd", "-4", "-f", "-d", "--no-pid", "eth0"]

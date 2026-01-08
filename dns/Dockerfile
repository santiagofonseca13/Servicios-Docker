# Usamos una imagen base de Ubuntu
FROM ubuntu:22.04

# Actualizamos e instalamos BIND9 y herramientas de red
RUN apt-get update && apt-get install -y bind9 dnsutils

# Creamos el directorio para los archivos PID y de sesión
RUN mkdir -p /run/named
# Le damos propiedad al usuario 'bind' (que es el usuario que ejecuta el CMD)
RUN chown bind:bind /run/named

# Copiamos nuestros archivos de configuración al contenedor
#COPY zones/db.santiagofonseca.osfg /etc/bind/zones/db.santiagofonseca.osfg

# Exponemos el puerto 53 (el puerto estándar de DNS)
EXPOSE 53/udp 53/tcp

# Comando que se ejecutará cuando el contenedor inicie
CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]

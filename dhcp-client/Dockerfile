# Dockerfile para Clientes DHCP (PC1 y PC2)
FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

# Instalar las herramientas necesarias
RUN apt-get update && apt-get install -y \
      openssh-server \
      openssh-client \
      isc-dhcp-client \
      iproute2 \
      dnsutils \
      iputils-ping \
      curl \
   && mkdir -p /var/run/sshd \
   && rm -rf /var/lib/apt/lists/*

# DEFINIR USUARIO ROOT Y CONTRASEÑA
ARG ROOT_PASSWORD=ubuntu
RUN echo "root:${ROOT_PASSWORD}" | chpasswd

# 3. CONFIGURAR EL SERVICIO SSH
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/^#?PasswordAuthentication\s+.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# 4. EXPONER EL PUERTO ESTÁNDAR DE SSH
EXPOSE 22

# Al iniciar: 1. Libera la IP de Docker. 2. Pide una IP por DHCP. 3. Inicia el servicio SSH en primer plano.
CMD /bin/bash -c "dhclient -r eth0 && dhclient -v eth0 && /usr/sbin/sshd -D -e"
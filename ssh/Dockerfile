FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    openssh-server \
    openssh-client \
    iputils-ping \
    net-tools \
    nano \
    && mkdir -p /var/run/sshd

# DEFINIR USUARIO ROOT Y CONTRASEÑA
ARG ROOT_PASSWORD=ubuntu
RUN echo "root:${ROOT_PASSWORD}" | chpasswd

# HABILITAR AUTENTICACIÓN POR LLAVE PÚBLICA
# Crear el directorio .ssh para el usuario root
RUN mkdir -p /root/.ssh
# Copiar tu llave pública (que preparamos en el Paso 2)
COPY authorized_keys /root/.ssh/authorized_keys
# Establecer los permisos correctos (¡Muy importante!)
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/authorized_keys

# 3. CONFIGURAR EL SERVICIO SSH
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/^#?PasswordAuthentication\s+.*/PasswordAuthentication no/' /etc/ssh/sshd_config

# 4. EXPONER EL PUERTO ESTÁNDAR DE SSH
EXPOSE 22

# 5. COMANDO DE INICIO
CMD ["/usr/sbin/sshd", "-D"]

FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
# Estos serán pasados desde docker-compose.yml
ARG FTP_USER=santiago
ARG FTP_PASS=ubuntu
ARG FTP_HOME=/srv/ftpdata  # Carpeta interna
ARG PASV_MIN=30000
ARG PASV_MAX=30009
ARG PASV_ADDRESS=192.168.56.100

RUN apt-get update && \
    apt-get install -y vsftpd nano iproute2 net-tools iputils-ping && \
    rm -rf /var/lib/apt/lists/*

# Crear el directorio de inicio del usuario FTP y establecer permisos
RUN useradd -m -d ${FTP_HOME} -s /bin/bash ${FTP_USER} && \
    echo "${FTP_USER}:${FTP_PASS}" | chpasswd && \
    mkdir -p ${FTP_HOME} && \
    chown -R ${FTP_USER}:${FTP_USER} ${FTP_HOME} && \
    chmod -R 755 ${FTP_HOME}

# --- CONFIGURACIÓN VSFTPD ---
RUN sed -i 's/^#?listen=.*/listen=YES/' /etc/vsftpd.conf && \
    sed -i 's/^#?listen_ipv6=.*/listen_ipv6=NO/' /etc/vsftpd.conf && \
    sed -i 's/^#?anonymous_enable=.*/anonymous_enable=NO/' /etc/vsftpd.conf && \
    sed -i 's/^#?local_enable=.*/local_enable=YES/' /etc/vsftpd.conf && \
    sed -i 's/^#?write_enable=.*/write_enable=YES/' /etc/vsftpd.conf && \
    (grep -q '^local_umask=' /etc/vsftpd.conf && sed -i 's/^local_umask=.*/local_umask=022/' /etc/vsftpd.conf || echo 'local_umask=022' >> /etc/vsftpd.conf) && \
    (grep -q '^utf8_filesystem=' /etc/vsftpd.conf && sed -i 's/^utf8_filesystem=.*/utf8_filesystem=YES/' /etc/vsftpd.conf || echo 'utf8_filesystem=YES' >> /etc/vsftpd.conf) && \
    (grep -q '^chroot_local_user=' /etc/vsftpd.conf && sed -i 's/^chroot_local_user=.*/chroot_local_user=YES/' /etc/vsftpd.conf || echo 'chroot_local_user=YES' >> /etc/vsftpd.conf) && \
    (grep -q '^allow_writeable_chroot=' /etc/vsftpd.conf && sed -i 's/^allow_writeable_chroot=.*/allow_writeable_chroot=YES/' /etc/vsftpd.conf || echo 'allow_writeable_chroot=YES' >> /etc/vsftpd.conf) && \
    sed -i '/^local_root=/d' /etc/vsftpd.conf && echo "local_root=${FTP_HOME}" >> /etc/vsftpd.conf && \
    sed -i '/^user_sub_token=/d' /etc/vsftpd.conf && echo "user_sub_token=${FTP_USER}" >> /etc/vsftpd.conf && \
    sed -i '/^pasv_enable=/d' /etc/vsftpd.conf && echo "pasv_enable=YES" >> /etc/vsftpd.conf && \
    sed -i '/^pasv_min_port=/d' /etc/vsftpd.conf && echo "pasv_min_port=${PASV_MIN}" >> /etc/vsftpd.conf && \
    sed -i '/^pasv_max_port=/d' /etc/vsftpd.conf && echo "pasv_max_port=${PASV_MAX}" >> /etc/vsftpd.conf && \
    sed -i '/^pasv_address=/d' /etc/vsftpd.conf && echo "pasv_address=${PASV_ADDRESS}" >> /etc/vsftpd.conf

# Exponer los puertos que usamos: 21 (control) y el rango pasivo
EXPOSE 21 ${PASV_MIN}-${PASV_MAX}

# Comando para iniciar vsftpd en primer plano
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]

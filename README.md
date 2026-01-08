# Servicios-Docker
Este proyecto consiste en la implementación y configuración de servicios esenciales de red utilizando contenedores. El objetivo principal fue aprender la administración de redes y la orquestación de servicios en entornos aislados y escalables.

🚀 Servicios Implementados
El entorno incluye la configuración de los siguientes protocolos:

DNS: Resolución de nombres de dominio interna.

FTP: Transferencia de archivos segura entre contenedores/host.

HTTP: Servidor web funcional para hosting de contenido.

SSH: Acceso remoto seguro a la administración del contenedor.

DHCP: Asignación dinámica de direcciones IP dentro de la red virtual de Docker.

🛠️ Tecnologías Utilizadas
Docker & Docker Compose: Para la creación y gestión de los contenedores.

Linux (Alpine/Ubuntu): Como imágenes base ligeras para los servicios.

Networking de Docker: Configuración de redes tipo bridge y static IPs.

📂 Estructura del Proyecto
Plaintext

* dns/         # Configuración de BIND9
* ftp/         # Configuración de vsftpd
* http/        # Archivos del servidor Apache/Nginx
* ssh/         # Configuración de OpenSSH
* docker-compose.yml  # Orquestador de todos los servicios

🔧 Cómo ejecutarlo
Clona este repositorio:
git clone https://github.com/santiagofonseca13/Docker-Services.git

Asegúrate de tener instalado Docker y Docker Compose.

🧠 Aprendizajes Clave
Aislamiento de servicios: Entender cómo separar capas de infraestructura.

Virtualización a nivel de OS: Diferencias entre máquinas virtuales tradicionales y contenedores.

Administración de Redes: Configuración de puertos, protocolos y comunicación inter-container.

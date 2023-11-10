FROM mariadb:latest

WORKDIR /app

# Copia el archivo de respaldo
COPY ./backup-file.sql ./

# Copia script de inicio
COPY ./init-script.sh ./

# Establece permisos
RUN chmod +x ./init-script.sh

# Ejecuta la migración al inicio
#CMD ["bash", "-c", "./init-script.sh"]

# Mensaje inicial de aviso
#CMD ["echo", "run: docker exec -it [contenedor]  bash -c ./init-script.sh"]

EXPOSE 3307


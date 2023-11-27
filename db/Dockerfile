FROM mariadb:latest

WORKDIR /app

# Copia el archivo de respaldo
COPY ./pre_interia/backup-file.sql /docker-entrypoint-initdb.d/


EXPOSE 3307


#!/bin/bash 



# obtiene los datos del backup-file.sql
mariadb tutoweb < backup-file.sql

echo "Base de datos recuperada con éxito"

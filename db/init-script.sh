#!/bin/bash 


# crea la base de datos
mariadb -u root -e 'create database tutoweb'

# obtiene los datos del backup-file.sql
mariadb tutoweb < backup-file.sql

echo "Base de datos recuperada con éxito"

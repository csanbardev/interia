
# Interia

Interia es una aplicación web que reune tutoriales de distinto tipo y recomendados por gente de verdad y no por un algoritmo. Está especialmente diseñada para que sea fácil encontrar una guía de YouTube para aprender lo que quieras. ¡Olvídate de perder el tiempo con treinta tutoriales distintos que están desactualizados o no sirven para nada!

Además, si quieres, puedes sugerir tus propios tutoriales o guardar -dar Like- aquellos que te interesen o parezcan útiles para apoyar a la comunidad. 


## Desplegar el local

Clona el proyecto

```bash
  git clone git@github.com:csanbardev/interia.git
```

Ve el directorio del proyecto

```bash
  cd interia
```

Clona los datos de los submódulos (api y front)

```bash
  git submodule update --init --recursive
```

Crea el archivo .env en el directorio api. Puedes usar en .env.example siguiendo las instrucciones o solicitarlo ya relleno.

También es necesario tener un archivo JSON con las credenciales de la API de Google para YouTube. Prueba aquí: https://developers.google.com/youtube/v3/getting-started


Inicia los contenedores definidos en docker-compose.yaml desde la raíz del proyecto

```bash
  docker compose up -d    
```

Si todo es correcto, debería crear las imágenes e iniciar los contenedores. Debería tener un aspecto similar a este:

```bash
   -> docker ps
        CONTAINER ID   IMAGE              COMMAND                  CREATED        STATUS         PORTS                                                 NAMES
        3d64b7f9532c   interia-front      "/docker-entrypoint.…"   22 hours ago   Up 2 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp                     interia-front-1
        c21fdcfa7666   interia-api        "docker-entrypoint.s…"   22 hours ago   Up 2 seconds   0.0.0.0:3006->3006/tcp, :::3006->3006/tcp             interia-api-1
        11f4a9eddbb9   interia-database   "docker-entrypoint.s…"   22 hours ago   Up 2 seconds   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 3307/tcp   interia-database-1

```

## Capturas de la aplicación

![App Screenshot](https://i.ibb.co/xjQG54V/Screenshot-2024-01-02-at-12-20-26-Interia.png)

![App Screenshot](https://i.ibb.co/DKgzHmR/Screenshot-2024-01-02-at-12-20-49-Interia.png)

![App Screenshot](https://i.ibb.co/dJNP28L/Screenshot-2024-01-02-at-12-21-01-Interia.png)


## FAQ

#### ¿Se pueden modificar los puertos de los servicios?

Si surge algún error por puertos en uso, no hay problema. Para cambiarlos, hay que modificar la asignación de puertos establecida en el docker-compose.yaml para cada servicio.

Luego, cada servicio comprometido tiene un Dockerfile que expone un determinado puerto; habría que editarlo. También que tener en cuenta las variables de entorno definidas en los archivos .env y las relaciones entre servicios:

Si cambias el puerto de la base de datos, no olvides cambiar la referencia en la API, etc.

#### ¿Por qué no se conservan los cambios en la base de datos al reiniciar el contenedor?

La idea es que sea un despliegue en local de prueba. Por tanto, no hay volúmenes definidos y la base de datos se rellena a partir de un fichero de backup.


no-more es una manera simple de evitar el dolor de cabeza de toda la tarea después de la nueva instalación de kali, sino también para guiar a las personas menos experimentadas. 

**NOTA**  No existe ninguna manera de aprender a hackear sin invertir

- tiempo
- esfuerzo
- organización

![IMG_20220429_230925_693](https://user-images.githubusercontent.com/64184513/166124722-3378bdb9-7d3c-4e40-9c4f-aa1a7e57bd59.jpg)

## Se ejecuta en 2 pasos.

1- Primero vamos a;

    - añadir la lista de fuentes, hacer todos los update && upgrade 
    - instalar todos los paquetes apt 
    - instalar los paquetes python
    - instalar gem 
    - instalar GO 
    - instalar docker
    - instalar metasploit-framework
    - establecer tmux por defecto
    - establecer dns en cloudflare
    - habilitar el registro de la sesión de bash 
    - iniciar el servicio
    - establecer algunas variables de entorno
    - limpiar

## Vamos a empezar, abre tu terminal root y sigue estos comandos uno por uno

cd /

apt-get install git -y

git clone https://github.com/SobrioRiot/no-more.git

cd no-more

chmod +x no_more.sh

./no_more.sh

## Es necesario reiniciar el sistema antes del paso 2.


2- El segundo paso creará una nueva carpeta, y luego instalará las herramientas en estas carpetas.

Vea la lista de herramientas en los archivos "list_tools.txt".

![IMG_20220429_230928_176](https://user-images.githubusercontent.com/64184513/166124803-63239410-61d9-4255-add2-7d5525f6fd20.jpg)
![IMG_20220429_230927_500](https://user-images.githubusercontent.com/64184513/166124816-e92c34fc-14ec-4ef7-a771-886e6a77982c.jpg)
------------------------------
#

### Abre de nuevo el terminal de root y sigue estos comandos

cd /no-more

chmod +x install_tools.sh

./install_tools.sh

-------------------------------

Eso es todo

/bin/bash
# Script 1 de 2
# por: wondR / #GhostSec / 
# Última actualización: Abril 2022
# OS: Kali Linux / versión:2022.1
# Debes ejecutar este script como ROOT **
apt-get install lolcat
clear

lolcat <<"EOF"

\===========/=============\===========/=============\===========/--no-mas-dolor-de-cabeza--\      

    ________       ________                     _____ ______       ________      ________      _______      
  |\   ___  \    |\   __  \                   |\   _ \  _   \    |\   __  \    |\   __  \    |\  ___ \     
  \ \  \\ \  \   \ \  \|\  \    ____________  \ \  \\\__\ \  \   \ \  \|\  \   \ \  \|\  \   \ \   __/|    
   \ \  \\ \  \   \ \  \\\  \  |\____________\ \ \  \\|__| \  \   \ \  \\\  \   \ \   _  _\   \ \  \_|/__  
    \ \  \\ \  \   \ \  \\\  \ \|____________|  \ \  \    \ \  \   \ \  \\\  \   \ \  \\  \|   \ \  \_|\ \ 
     \ \__\\ \__\   \ \_______\                  \ \__\    \ \__\   \ \_______\   \ \__\\ _\    \ \_______\
      \|__| \|__|    \|_______|                   \|__|     \|__|    \|_______|    \|__|\|__|    \|_______|
                                                                                                                                                                                                                                                                                                                         
   
                                                                                                                                                                                                                                                                                                                         
\-------------//-------------\\\\por wondR //


TRUCOS --> ¡piensa en apagar tu salvapantallas!
((in menu / power
EOF

current_date=$(date)
echo "Starting at $current_date"

ROOT_DIR=/root

lolcat <<"EOF"


    -----¿ES USTED ROOT?!----


EOF

# comprueba si somos ROOT
if [ $EUID -ne 0 ]; then
  echo "Este script debe ser ejecutado como root".
  exit 1
fi

# habilitar el alias de comandos
shopt -s expand_aliases

# omitir los avisos en apt-upgrade...
export DEBIAN_FRONTEND=noninteractive
alias apt-get='yes "" | apt-get -o Dpkg::Options::="--force-confdef" -y'
apt-get update

# arreglar bashrc
cp /root/.bashrc /root/.bashrc.bak
cp "/home/$(grep -F 1000:1000 /etc/passwd | cut -d: -f1)/.bashrc" /root/.bashrc
. /root/.bashrc

# ------------------------------------------------------

lolcat <<"EOF"


┌─┐┌─┐┬ ┬┬─┐┌─┐┌─┐ ┬  ┬┌─┐┌┬┐
└─┐│ ││ │├┬┘│  ├┤  │  │└─┐ │ 
└─┘└─┘└─┘┴└─└─┘└─┘o┴─┘┴└─┘ ┴ 


EOF
echo "añadiendo lista de fuentes.."
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list
echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee -a /etc/apt/sources.list
# actualizar la distro
apt-get dist-upgrade -y

printf '\n-------------Finalizado--------------\n\n'

# ------------------------------------------------------


lolcat <<"EOF"




▌│"║▌║▌║ Preparando... ║▌║▌║"│▌



EOF


printf '\n▌│║▌║▌║ Instalando paquetes ▌│"║▌║▌║\n'
printf '\n-------------------------------------\n\n'

apt-get install -y git gnupg2 wget tor ca-certificates lsb-release gem software-properties-common debian-keyring vim cargo geany gdebi gufw bleachbit iptables tmux libffi-dev build-essential binutils-dev docker.io konsole aptitude libunwind-dev unzip libssl-dev autoconf automake gcc libtool jq awscli npm graphviz golang
apt-get install -y doona dotdotpwn linux-exploit-suggester oscanner siparmyknife xsser knockpy urlextractor pompem dirsearch

printf '\n-------------Finalizado--------------\n\n'

borrar

printf '\n▌│"║▌║▌║ Instalando Python3 ▌│"║▌║▌║\n'
printf '\n------------------------------------\n\n'

apt-get -y install python3-venv 
python3 -m pip install pipenv
pip install virtualenvwrapper uncompyle6 git-filter-repo python-whois colorama bs4 virtualenv wheel boto3 botocore termcolor requests

printf '\n-------------Finalizado--------------\n\n'


# habilitar gufw
gufw enable

borrar 

printf '\n Instalando gem... \n'
printf '\n-----------------------------------------\n\n'
gem install bundler && bundle config set --locale without test
gem install rubygems-update
apt full-upgrade
gem install wpscan

printf '\n-------------Finalizado--------------\n\n'

borrar 

printf '\n▌│"║▌║▌║ Iniciando Docker ▌│"║▌║▌║\n'
printf '\n---------------------------------------------\n\n'

# habilitar e iniciar docker
systemctl stop docker &>/dev/null
echo '{"bip":"172.16.199.1/24"}' >/etc/docker/daemon.json
systemctl enable docker --now

printf '\n-------------Finalizado--------------\n\n'

borrar

printf '\n Instalación de Metasploit-framework \n'
printf '\n------------------------------------------------------------------\n\n'

curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb >msfinstall &&
    chmod 755 msfinstall &&
    ./msfinstall

# Esto es para evitar el problema con apt-key 
echo 'deb http://apt.metasploit.com/ lucid main' > /etc/apt/sources.list.d/metasploit-framework.list
wget -nc http://apt.metasploit.com/metasploit-framework.gpg.key
cat metasploit-framework.gpg.key | gpg --dearmor > metasploit-framework.gpg
install -o root -g root -m 644 metasploit-framework.gpg /etc/apt/trusted.gpg.d/
apt-get update

# Inicializando la base de datos de Metasploit
systemctl start postgresql
systemctl enable postgresql
msfdb init

printf '\n-------------Finalizado--------------\n\n'

clear

# iniciando el servicio
service postgresql start
service tor start
service mysql start
/etc/init.d/apache2 start
echo "
Iniciando servicios.. 
======================
-PostgreSQL
-Tor
-Apache
-Mysql
...
"

printf '\n-------------Finalizado--------------\n\n'

borrar

printf '\n▌│║▌║▌║ Configuración de GO ▌│║▌║▌║\n'
printf '\n-------------------------------------\n\n'
cd $ROOT_DIR/
wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash

printf '\n-------------Finalizado--------------\n\n'

clear
# -------------------------------------------------------
# Configuracion
# -------------------------------------------------------

echo "Actualizando..."
apt-get update
apt-get upgrade

printf '\n-------------Finalizado--------------\n\n'

borrar 

# configuración por defecto de tmux
cat <<EOF >$HOME/.tmux.conf
    set -g mouse on
    set -g history-limit 50000
    set -g prefix2 C-a
    bind C-a send-prefix 
    unbind C-b
    set-window-option -g mode-keys vi

    run-shell /opt/tmux-logging/logging.tmux

    # Lista de plugins
    set -g @plugin 'tmux-plugins/tmux-logging'

    # Inicializar el gestor de plugins TMUX (mantener esta línea en la parte inferior de tmux.conf)
    ejecutar '~/.tmux/plugins/tpm/tpm'
EOF

# =======================================================

# Para usar el DNS de Cloudflare
echo -e "\n2.\NUsa Cloudflare DNS...\N"
sudo echo -e "nnameserver 1.1.1\nnameserver 1.0.0.1" > /etc/resolv.conf

printf '\n-------------Finalizado--------------\n\n'

clear

# =======================================================

printf '\n[+] Enabling bash session logging\n\n'

grep -q 'UNDER_SCRIPT' ~/.bashrc || echo "if [[ -z "$UNDER_SCRIPT" && -z "$TMUX" && ! -z "$PS1" ]]; then
    logdir=$HOME/Logs 
    if [ ! -d $logdir ]; then
            mkdir $logdir
    fi
    #gzip -q $dir/*.log &>/dev/null
    logfile=$logdir/$(fecha +%F_%H_%M_%S).$$.log
    export UNDER_SCRIPT=$fichero de registro
    script -f -q $fichero de registro
    exit
fi" >>~/.bashrc

printf '\n-------------Finalizado--------------\n\n'
clear 

# =======================================================
echo "Finalizando..."

echo "Limpiando..."
apt-get autoremove -y
apt-get autoclean -y
updatedb

borrar

#--------------------------------------------------

# VARIABLES DE ENTORNO
PROMPT_CHAR=$(if [ "$(whoami)" == "root" ]; then echo "#"; else echo "$"; fi)
HOST_COLOR=$(if [ "$(whoami)" == "root" ]; then echo "6"; else echo "1"; fi)
export PS1="\[\e[0;3${HOST_COLOR}m\]\H\[\e[0;37m\]|\[\e[0;32m\]\A\[\e[0;37m\]|\[\e[0;33m\]\w\[\e[0;3${HOST_COLOR}m\] ${PROMPT_CHAR} \N - [\N - 1;0m\]"

# =======================================================

# OTROS AJUSTES Y HACKS
export HISTCONTROL=ignoredups:erasedups # no hay entradas duplicadas
export HISTSIZE=100000 # historial grande
export HISTFILESIZE=100000 # historial grande
shopt -s histappend # añadir al historial, no sobrescribirlo
# Guarda y recarga el historial después de que termine cada Comando
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# =======================================================
borrar

lolcat <<"EOF"


▌│"║▌║▌║ Necesita reiniciar ahora ║▌║▌║"│▌


EOF

sed -i -r "s:~/:$ROOT_DIR/:" $ROOT_DIR/.bashrc

/bin/bash
# Script 2 de 2
# por: wondR / #GhostSec /
# Última actualización: Abril 2022
# OS: Kali Linux / versión:2022.1
# Debes ejecutar este script como ROOT **

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



lolcat <<"EOF"



█▀▀▀ ░▀░ ▀▀█▀▀   █▀▀█ █▀▀ █▀▀█ █▀▀█
█░▀█ ▀█▀ ░░█░░   █▄▄▀ █▀▀ █░░█ █░░█
▀▀▀▀ ▀▀▀ ░░▀░░   ▀░▀▀ ▀▀▀ █▀▀▀ ▀▀▀▀

EOF


printf '\n-----------------------------------------------------\n'
printf '\n Creando directorio en /root:\n'
printf '\n - data (wordlist && dic\n'
printf '\n - utilidades (gestión local)\n'
printf '\n - herramientas (con subcategoría)\n'
printf '\n - trabajo (carpeta personal)\n'
printf '\n-----------------------------------------------------\n\n'
cd $ROOT_DIR
mkdir {datos,utilidades,herramientas,trabajo}
clear

echo "Descargando..."
cd $ROOT_DIR/utils
git clone https://github.com/Arr0way/linux-local-enumeration-script.git
git clone https://github.com/CISOfy/lynis.git

printf '\n-------------Finalizado--------------\n\n'
borrar

cd $ROOT_DIR/data
git clone https://github.com/fuzzdb-project/fuzzdb.git
git clone https://github.com/danielmiessler/SecLists.git
git clon https://github.com/swisskyrepo/PayloadsAllTheThings.git
git clone https://github.com/1N3/IntruderPayloads
git clon https://github.com/duyetdev/bruteforce-database.git
wget https://gist.githubusercontent.com/mgeeky/8b7b1c8d9fe8be69978d774bddb6e382/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt

printf '\n-------------Finalizado--------------\n\n'
borrar
printf '\n-----------------------------------------------------\n'
printf '\n Creando directorio en /tools:\n'
printf '\n - bruteforce (Cracking)\n'
printf '\n - drkfuz (Dork && Fuzz)\n'
printf '\n - installer (Todo en uno para instalar otras herramientas)\n'
printf '\n - recon (Reconocimiento Activo)\n'
printf '\n - SE (Ingenieria Social && OSINT)\n'
printf '\n - Ddos (Denegacion de servicio distribuido)\n'
printf '\n - shells (Generación de varios SHELL)\n'
printf '\n - ssl (Scanner SSL)\n'
printf '\n - web (Varios Escáner web )\n'
printf '\n - windows (Todo lo relacionado con objetivos de Windows)\n'
printf '\n - hacking (Relacionado  a Ataque )\n'
printf '\n-----------------------------------------------------\n\n'
cd $ROOT_DIR/tools
mkdir {bruteforce,windows,SE,recon,web,drkfuz,installer,Ddos,ssl,hacking,shells}
clear
echo "Instalando herramientas..."

pushd bruteforce 
git clone https://github.com/NeverWonderLand/d00r.git
git clone https://github.com/lanjelot/patator.git
git clone https://github.com/galkan/crowbar.git
git clone --depth=1 --branch=master https://www.github.com/landgrey/pydictor.git && chmod 755 pydictor/pydictor.py
popd 

printf '\n-------------Finalizado--------------\n\n'
borrar

pushd drkfuz 
git clone https://github.com/NeverWonderLand/Photon.git
git clone https://github.com/googleprojectzero/domato.git
git clon https://github.com/FrancescoDiSalesGithub/dorker
wget http://www.immunitysec.com/downloads/SPIKE2.9.tgz
tar -xvzf SPIKE2.9.tgz
rm SPIKE2.9.tgz
git clone https://gitlab.com/akihe/radamsa.git
wget https://github.com/shellphish/fuzzer.git
wget http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz
tar -xvzf afl-latest.tgz
rm afl-latest.tgz
cd $(find . -type d -name 'afl-*' -maxdepth 1 2>/dev/null)
make -j 8
make install
cd ..
popd 

printf '\n-------------Finalizado--------------\n\n'
borrar

pushd installer
git clone https://github.com/Ha3MrX/Hacking.git
git clon https://github.com/Manisso/fsociety.git
popd 

printf '\n-------------Finalizado--------------\n\n'
borrar

pushd recon 
git clone https://github.com/AlisamTechnology/ATSCAN.git
git clone https://github.com/projectdiscovery/nuclei.git
git clone https://github.com/projectdiscovery/nuclei-templates.git
git clone https://github.com/tahmed11/DeepScan.git
git clon https://github.com/machine1337/fast-scan.git
git clon https://github.com/Tib3rius/AutoRecon.git
git clon https://github.com/FortyNorthSecurity/EyeWitness.git
git clon https://github.com/smicallef/spiderfoot.git
git clon https://github.com/infosec-au/altdns.git
git clon https://github.com/aboul3la/Sublist3r.git
git clon https://github.com/michenriksen/aquatone.git
git clon https://github.com/NeverWonderLand/Lethe.git
git clon https://github.com/leebaird/discover.git
git clon https://github.com/evyatarmeged/Raccoon.git 
popd 

printf '\n-------------Finalizado--------------\n\n'
borrar

pushd SE 
git clone https://github.com/NeverWonderLand/ghost_eye.git
git clone https://github.com/pentestgeek/phishing-frenzy.git
git clone https://github.com/trustedsec/social-engineer-toolkit.git
git clone https://github.com/NeverWonderLand/AdvPhishing.git
git clon https://github.com/sherlock-project/sherlock.git
git clon https://github.com/Anish-M-code/URL-obfuscator.git 
popd

printf '\n-------------Finalizado--------------\n\n'
borrar

pushd hacking
git clone https://github.com/thehackingsage/hacktronian.git
git clone https://github.com/aydinnyunus/Keylogger.git
git clon https://github.com/Thibault-69/RAT-Hodin-v2.9.git
git clon https://github.com/NeverWonderLand/A-Rat.git
popd 

printf '\n-------------Finalizado--------------\n\n'
borrar

pushd Ddos 
git clone https://github.com/NeverWonderLand/Impulse.git
git clone https://github.com/7zx/overload.git
git clon https://github.com/NeverWonderLand/SniperMan.git
git clone https://github.com/NeverWonderLand/DDoS-Ripper.git
git clon https://github.com/NeverWonderLand/Anonymous.git
git clon https://github.com/Ha3MrX/DDos-Attack.git
git clon https://github.com/5inco/PHDoS.git
git clon https://github.com/Anlos0023/webdos-ddoser.git
https://github.com/PraneethKarnena/DDoS-Scripts.git
popd 

printf '\n-------------Finalizado--------------\n\n'
clear

pushd shells 
git clone https://github.com/machine1337/mafiahacks.git
git clon https://github.com/BlackArch/webshells.git
git clon https://github.com/Ne0nd0g/merlin.git
git clon https://github.com/t0thkr1s/revshellgen.git
popd 

printf '\n-------------Finalizado--------------\n\n'
borrar

pushd ssl 
git clone https://github.com/rbsec/sslscan.git
git clone https://github.com/drwetter/testssl.sh.git
git clon https://github.com/tomato42/tlsfuzzer.git
popd 

printf '\n-------------Finalizado--------------\n\n'
borrar

pushd web 
git clone https://github.com/commixproject/commix.git
git clone https://github.com/droope/droopescan.git
git clon https://github.com/beefproject/beef/
cd vacuno 
sí | ./install
cd ..
git clone https://github.com/mitmproxy/mitmproxy.git
git clone https://github.com/sqlmapproject/sqlmap.git
git clone https://github.com/RhinoSecurityLabs/SleuthQL
git clone https://github.com/EnableSecurity/wafw00f.git
git clone https://github.com/wpscanteam/wpscan.git
git clon https://github.com/OJ/gobuster.git
git clon https://github.com/GerbenJavado/LinkFinder.git
git clon https://github.com/OWASP/Amass.git
git clon https://github.com/ticarpi/jwt_tool.git
git clon https://github.com/arthaud/git-dumper.git
git clon https://github.com/bambish/ScanQLi.git
git clon https://github.com/QSoloX/toolkit-example.git
popd 

printf '\n-------------Finalizado--------------\n\n'
borrar

pushd windows 
git clone https://github.com/brav0hax/smbexec.git
git clon https://github.com/lgandx/Responder.git
git clon https://github.com/BloodHoundAD/BloodHound.git
git clone https://github.com/EmpireProject/Empire.git
git clon https://github.com/PowerShellMafia/PowerSploit.git
git clon https://github.com/samratashok/nishang.git
popd 

printf '\n-------------Finalizado--------------\n\n'
clear

echo "Actualizando.."
apt-get update -y

clear

lolcat <<"EOF"


▌│"║▌║▌║ Hecho. ¡Feliz hackeo! ║▌║▌║"│▌


EOF

#!/bin/bash
# Define variables
LSB=/usr/bin/lsb_release

cd /home

clear 
echo Vamos a añadir los repositorios al sistema
echo 
sleep 2s
echo -e '##GKSU\ndeb http://deb.debian.org/debian/ stretch main\ndeb-src http://deb.debian.org/debian/ stretch main\n##backports\ndeb http://ftp.debian.org/debian/ buster-backports main non-free\ndeb-src http://ftp.debian.org/debian/ buster-backports main non-free\n##multimedia\ndeb http://www.deb-multimedia.org buster main non-free\ndeb http://www.deb-multimedia.org buster-backports main\n##ACTUALIZACIONES DE KERNELdeb http://mirrors.kernel.org/debian/ buster-updates main contrib non-free\ndeb-src http://mirrors.kernel.org/debian/ buster-updates main contrib non-free\ndeb http://mirrors.kernel.org/debian buster-proposed-updates main contrib non-free\ndeb-src http://mirrors.kernel.org/debian buster-proposed-updates main contrib non-free\n##ACTIVACIÓN DE LOS REPOSITORIOS PRIVATIVOS EN DEBIAN\ndeb http://ftp.de.debian.org/debian/ buster main contrib non-free\ndeb-src http://ftp.de.debian.org/debian/ buster main contrib non-free\ndeb http://security.debian.org/ buster/updates main contrib non-free\ndeb-src http://security.debian.org/ buster/updates main contrib non-free\n##SPOTIFY\ndeb http://repository.spotify.com stable non-free\n##ANYDESK\ndeb http://deb.anydesk.com/ all main\n##SKYPE\ndeb https://repo.skype.com/deb stable main' >> /etc/apt/sources.list
wget https://archive.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb
dpkg -i deb-multimedia-keyring_2016.8.1_all.deb
rm deb-multimedia-keyring_2016.8.1_all.deb
apt-get install curl
curl -sS https://download.spotify.com/debian/pubkey.gpg | apt-key add - 
curl https://repo.skype.com/data/SKYPE-GPG-KEY | apt-key add -
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
apt-get update
apt-get upgrade 
apt-get autoremove

clear
echo Vamos a crear un fichero swap para que nuestro sistema vaya más fluido
echo sleep 2s
echo 
dd if=/dev/zero of=/var/swap bs=4096k count=1024
chmod 600 /var/swap
mkswap /var/swap
swapon /var/swap
echo '/var/swap  none        swap    sw,pri=30     0     0' >> /etc/fstab

clear
echo Vamos a instalar los paquetes básicos del sistema
echo 
sleep 2s
apt-get install linux-headers-$(uname -r|sed 's/[^-]*-[^-]*-//') build-essential make automake cmake autoconf lshw deborphan ufw gufw openjdk-11-jre icedtea-netx tlp tlp-rdw keepass2 gdebi gparted thunderbird wget thermald tlp tlp-rdw gimp gscan2pdf tesseract-ocr tesseract-ocr-spa mutt htop nmap zenmap macchanger proxychains traceroute whatweb whois arduino ntpdate ntpstat ntp speedtest-cli aptitude openvpn dialog python3-pip python3-setuptools git geany lm-sensors mono-complete spotify-client clamav clamtk clonezilla baobab galculator chntpw nwipe testdisk anydesk skypeforlinux
chmod -R 755 /usr/share/anydesk
chmod 755 /var/lib/dpkg/info/anydesk.p*
dpkg --configure anydesk
apt-get install -f
pip3 install protonvpn-cli
cd /usr/lib/keepass2/Plugins
wget https://passifox.appspot.com/KeePassHttp.plgx
chmod 644 KeePassHttp.plgx
apt-get update
apt-get upgrade
apt-get dist-upgrade
apt-get autoremove

clear
echo Vamos ha acelerar el sistema
echo
sleep 2s
echo -e 'vm.swappiness=10\nvm.vfs_cache_pressure=1000\nvm.dirty_writeback_centisecs=1500\nvm.dirty_expire_centisecs=4500\nvm.dirty_ratio=30\nvm.dirty_background_ratio=15' >> /etc/sysctl.conf

clear
echo Vamos ha activar el PRELINK
echo 
sleep 2s

sed -i 's/PRELINKING=unknown/PRELINKING=yes/g' "/etc/default/prelink"
echo 'DPkg::Post-Invoke {"echo Ejecutando prelink, por favor espere...;/etc/cron.daily/prelink";}' >> /etc/apt/apt.conf

clear
echo Vamos a activar el cortafuegos y la protección contra sobrecalentamiento
echo 
sleep 2s
ufw enable
tlp start

clear
echo Vamos ha añadir Flash a Firefox
echo 
sleep 2s
wget https://raw.githubusercontent.com/cybernova/fireflashupdate/master/fireflashupdate.sh
chmod +x fireflashupdate.sh
./fireflashupdate.sh
rm fireflashupdate.sh

clear
echo Vamos a actualizar el sistema
echo
sleep 2s
apt-get update
apt-get upgrade -y


clear
echo Vamos a limpiar el sistema
echo 
sleep 2s
apt-get purge --autoremove
apt-get purge $(deborphan --find-config)
apt-get autoclean
apt-get purge --autoremove

rm /home/Pulsera-Pasiva

echo Tarea finalizada, hasta luego.
echo Powered by cu0uz
sleep 5

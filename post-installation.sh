#!/bin/bash

echo Vamos a optimizar el sistema!
  
sleep 1s

echo Paso 1-. Añadimos repositorios:
  
sleep 1s
 
echo -e '##GKSU\ndeb http://deb.debian.org/debian/ stretch main\ndeb-src http://deb.debian.org/debian/ stretch main\n##backports\ndeb http://ftp.debian.org/debian/ buster-backports main non-free\ndeb-src http://ftp.debian.org/debian/ buster-backports main non-free\n##multimedia\ndeb http://www.deb-multimedia.org buster main non-free\ndeb http://www.deb-multimedia.org buster-backports main\n##ACTUALIZACIONES DE KERNELdeb http://mirrors.kernel.org/debian/ buster-updates main contrib non-free\ndeb-src http://mirrors.kernel.org/debian/ buster-updates main contrib non-free\ndeb http://mirrors.kernel.org/debian buster-proposed-updates main contrib non-free\ndeb-src http://mirrors.kernel.org/debian buster-proposed-updates main contrib non-free\n##ACTIVACIÓN DE LOS REPOSITORIOS PRIVATIVOS EN DEBIAN\ndeb http://ftp.de.debian.org/debian/ buster main contrib non-free\ndeb-src http://ftp.de.debian.org/debian/ buster main contrib non-free\ndeb http://security.debian.org/ buster/updates main contrib non-free\ndeb-src http://security.debian.org/ buster/updates main contrib non-free\n##SPOTIFY\ndeb http://repository.spotify.com stable non-free\n##ANYDESK\ndeb http://deb.anydesk.com/ all main\n##SKYPE\ndeb https://repo.skype.com/deb stable main' > /etc/apt/sources.list


echo Hemos terminado! Ahora disfruta de tu Distribución Mx-Linux totalmente funcional.

echo Powered by cu0uz

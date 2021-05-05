#!/usr/bin/env bash   
echo "Creando la maquina web1"
sudo lxc launch ubuntu:18.04 web1 < /dev/null

echo "Actualizando repositorios"
lxc exec web1 -- apt update -y

lxc exec web1 -- apt upgrade -y

echo "Instalando apache2"
lxc exec web1 -- apt install apache2 -y

echo "Habilitando apache2"
lxc exec web1 -- systemctl enable apache2 

echo "Reiniciando estatus haproxy"
lxc exec web1 -- systemctl restart apache2

echo "Validando estatus haproxy"
lxc exec web1 -- systemctl status apache2

echo "##################Finaliza script##############"

exit
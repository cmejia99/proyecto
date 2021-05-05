#!/usr/bin/env bash   
echo "Creando la maquina haproxy"
sudo lxc launch ubuntu:18.04 haproxy < /dev/null

echo "Actualizando repositorios"
lxc exec haproxy -- apt update -y

lxc exec haproxy -- apt upgrade -y

echo "Instalando haproxy"
lxc exec haproxy -- apt install haproxy -y

echo "Habilitando haproxy"
lxc exec haproxy -- systemctl enable haproxy 

echo "Reiniciando estatus haproxy"
lxc exec haproxy -- systemctl restart haproxy

echo "Validando estatus haproxy"
lxc exec haproxy -- systemctl status haproxy

echo "##################Finaliza script##############"

exit
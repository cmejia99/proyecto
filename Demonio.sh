###Servidor web1
ssh-keygen
###Servidor BAckup
ssh-copy-id vagrant@192.168.100.5

###Comando
ssh vagrant@192.168.100.5 lxc start web1bck

touch v_web1.sh

sudo ln -s v_web1.sh v_web

#################Archivo servicios ##########################
[Unit]
Description=Servicio validacion servidor web
After=network.target

[Service]
User=vagrant
WorkingDirectory=/home/vagrant/
Type=simple
ExecStart=/home/vagrant/v_web
GuessMainPID=no

[Install]
WantedBy=multi-user.target
##################################################

sudo cp v_web.service /lib/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable v_web.service

sudo systemctl start v_web.service

#!/usr/bin/env bash
#i=0
#while [ $i -lt 100000 ]
#while [ true ]
#do
#       let i=$i+1
#       echo $i
#done
some_ip_here=10.76.166.50
echo $some_ip_here
while [ true ]
do
        ping -c1 $some_ip_here > /dev/null
        if [ $? -eq 0 ]
        then
                  echo 1
                  ssh vagrant@192.168.100.5 lxc info web1bck > /home/vagrant/status
                  echo "Se creo el archivo status remoto"
                  if grep "Stopped" /home/vagrant/status
                  then
                            echo "Servidor web1bck ya detenido"
                  else
                            ssh vagrant@192.168.100.5 lxc stop web1bck > /dev/null
                  fi
           else
                      echo 0
                      ssh vagrant@192.168.100.5 lxc info web1bck > /home/vagrant/status
                      echo "Se creo el archivo status remoto 2"
                      if grep "Running" /home/vagrant/status
                      then
                              echo "Servidor web1bck ya iniciado"
                      else
                         ssh vagrant@192.168.100.5 lxc start web1bck
                      fi
        fi
done
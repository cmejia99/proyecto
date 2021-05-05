Vagrant.configure("2") do |config|   
   config.vm.define :servidorHa1 do |servidorHa1|
   servidorHa1.vm.box = "bento/ubuntu-20.04"
   servidorHa1.vm.network :private_network, ip: "192.168.100.1"   
   servidorHa1.vm.hostname = "servidorHa1"   
   servidorHa1.vm.provision :shell, path: "Scripts/script.sh"     
   servidorHa1.vm.provision :shell, path: "Scripts/script_haproxy.sh"        
   end   
   config.vm.define :servidorweb1 do |servidorweb1|
   servidorweb1.vm.box = "bento/ubuntu-20.04"
   servidorweb1.vm.network :private_network, ip: "192.168.100.2"   
   servidorweb1.vm.hostname = "servidorweb1"   
   servidorweb1.vm.provision :shell, path: "Scripts/script_webs.sh"
   servidorweb1.vm.provision :shell, path: "Scripts/script_web1.sh"          
   end   
end 

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  
		 def create_consul_host(config, hostname)
			config.vm.define hostname do |host|

				host.vm.hostname = hostname
			end
			config.vm.provider "virtualbox" do |vb|
			    mac = "525400" + Array.new(6){[*"A".."F", *"0".."9"].sample}.join
				vb.customize ["modifyvm", :id, "--audio", "none"]
			#	vb.customize ["modifyvm", :id, "--nic1", "NatNetwork"]
				vb.customize ["modifyvm", :id, "--macaddress1", mac]
				vb.gui = false
				vb.memory = "1555"
			end
			
 
		end 

		for host_number in 1..3
			hostname="host-#{host_number}"
			create_consul_host config, hostname
			config.vm.provision :shell, path: "bootstrap1.sh"
		end
		

end



Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  (1..3).each do |i|
      config.vm.define "k8s-node-#{i}" do |node|    
  	  node.vm.hostname = "k8s-node-#{i}"
	  ipaddress = "10.1.2.1#{i}"
	  node.vm.network "private_network", ip: ipaddress,  virtualbox__intnet: true
	  	 node.vm.provider "virtualbox" do |vb|
				mac1 = "525400" + Array.new(6){[*"A".."F", *"0".."9"].sample}.join
				mac2 = "525401" + Array.new(6){[*"A".."F", *"0".."9"].sample}.join
				vb.customize ["modifyvm", :id, "--audio", "none"]
				vb.customize ["modifyvm", :id, "--nic1", "Nat"]
				vb.customize ["modifyvm", :id, "--macaddress1", mac1]
				vb.customize ["modifyvm", :id, "--nic2", "intnet"]
				vb.customize ["modifyvm", :id, "--macaddress2", mac2]

				vb.gui = false				
				vb.memory = "1024"
		        end

		#node.vm.provision "file", source: "sshd_config", destination: "/etc/ssh/sshd_config"

		#add ssh keys
		node.vm.provision "shell", inline: "mkdir /home/vagrant/.ssh ; true"
		node.vm.provision "file", source: "id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
		node.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
		node.vm.provision "shell", inline: "chmod 600 /home/vagrant/.ssh/id_rsa"		

		#remote ssh access
		node.vm.provision :shell, path: "bootstrap1.sh"
		node.vm.provision "shell", inline: "apt -qq update && apt -qq upgrade -y && apt -qq install git python python-pip -y"
		node.vm.provision "file", source: "bootstrap2.sh", destination: "/home/vagrant/bootstrap2.sh"
		node.vm.provision "shell", inline: "chmod +x bootstrap2.sh"
		node.vm.provision "shell", inline: "./bootstrap2.sh"

		end
		
	end
	

			

	

end

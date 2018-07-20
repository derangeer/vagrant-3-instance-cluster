#!/usr/bin/env bash
if [ "$HOSTNAME" = k8s-node-1 ]; then
	git clone https://github.com/kubernetes-incubator/kubespray.git
	chmod 777 kubespray -R
	cd kubespray
	pip install -r requirements.txt
	cp -rfp inventory/sample inventory/mycluster
	declare -a IPS=(10.1.2.11 10.1.2.12 10.1.2.13)
	CONFIG_FILE=inventory/mycluster/hosts.ini python3 contrib/inventory_builder/inventory.py ${IPS[@]}
	echo "[all:vars]
ansible_connection=ssh
ansible_ssh_user=vagrant" >> inventory/mycluster/hosts.ini
fi

Vagrant.configure("2") do |config|
    config.vm.box_check_update = false
    config.vm.synced_folder ".", "home/vagrant/", disabled: true
    config.vm.provision "shell", "inline" => "sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; sudo systemctl restart sshd;", run: "always"
    config.vm.define "devops-sandbox" do |devops|
        devops.vm.box = "ubuntu/jammy64"
        devops.vm.network "private_network", type: "dhcp", virtualbox__intnet: true, auto_config: true, name: "devops-sandbox", ip: "192.168.199.9"
        devops.vm.hostname = "devops-sandbox"
        
        devops.vm.provider "virtualbox" do |v|
            v.memory = 4096
            v.cpus = 2
            v.name = "devops-sandbox"
        end

        devops.vm.provision "shell", path: "scripts/install.sh"
    end
end
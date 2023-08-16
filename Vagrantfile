Vagrant.configure("2") do |config|
    config.vm.define "devops-sandbox" do |devops|
        devops.vm.box = "ubuntu/jammy64"
        devops.vm.network "private_network", ip: "192.168.199.9", type: "dhcp"
        devops.vm.hostname = "devops-sandbox"
        devops.vm.provision "shell", path: "scripts/install.sh"
      
        devops.vm.provider "virtualbox" do |v|
            v.memory = 4096
            v.cpus = 2
            v.name = "devops-sandbox
        end
    end
end
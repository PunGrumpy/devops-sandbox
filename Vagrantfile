Vagrant.configure("2") do |config|
    config.vm.define "devops-sandbox" do |devops|
        devops.vm.box = "ubuntu/jammy64"
        devops.vm.forward_port, guest: 9000, host: 9000, host_ip: "127.0.0.1"
        devops.vm.network "private_network", ip: "192.168.199.9", type: "dhcp"
        devops.vm.hostname = "devops-sandbox"
        devops.vm.provision "shell", path: "scripts/install.sh"
      
        devops.vm.provider "virtualbox" do |v|
            v.vmx["memsize"] = "4096"
            v.vmx["numvcpus"] = "2"
            v.vmx["displayname"] = "devops-sandbox"
        end
    end
end
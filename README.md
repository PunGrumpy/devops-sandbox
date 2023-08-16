<div align="center">
    <h1><code>🐋</code> DevOps Sandbox</h1>
    <p>Vagrant project with Ubuntu box and tools for DevOps</p>
</div>

## 🚀 Quick start

1.  **Install Vagrant**

    Download and install [Vagrant](https://developer.hashicorp.com/vagrant/downloads) for your OS.

2.  **Start the VM**

    ```shell
    vagrant up
    ```

3.  **Connect to the VM**

    ```shell
    vagrant ssh
    ```

4.  **Stop the VM**

    ```shell
    vagrant halt
    ```

5.  **Destroy the VM**

    ```shell
    vagrant destroy
    ```

## 🧐 What's inside?

A quick look at the top-level files and directories you'll see in this project.

```bash
.
├── README.md
├── scripts
│  ├── install.sh
│  └── install_cdktf.sh
└── Vagrantfile
```

1.  **`/scripts`**: This directory contains all the scripts to install the tools.

2.  **`/Vagrantfile`**: This file contains the configuration for the VM.

## ⚙️ Tools

- [Terraform](https://www.terraform.io/)
- [CDK for Terraform](https://www.hashicorp.com/blog/cdk-for-terraform-enabling-python-and-typescript-support)
- [AWS CLI](https://aws.amazon.com/cli/)
- [Ansible](https://www.ansible.com/)

## 📝 License

Licensed under the [MIT License](./LICENSE).

#!/bin/bash

# Set debug mode
set -x

# Check RedHat
if [ -e /etc/redhat-release ]; then
    REDHAT_BASED=true
fi

TERRAFORM_VERSION="1.5.5"
PACKER_VERSION="1.9.2"

# Create SSH key
[[ ! -f /home/vagrant/.ssh/devops ]] \
    && mkdir -p /home/vagrant/.ssh \
    && ssh-keygen -f /home/vagrant/.ssh/devops -t rsa -N '' \
    && chown -R vagrant:vagrant /home/vagrant/.ssh

# Install packages
if [ ${REDHAT_BASED} ]; then
    yum -y update
    yum -y install docker ansible git unzip wget python3-pip
else
    apt-get update
    apt-get -y install docker.io ansible git unzip wget python3-pip
fi

# Add Docker privileges
usermod -aG docker vagrant

# Install AWS CLI and EB CLI
pip3 install -U awscli
pip3 install -U awsebcli

# Install Terraform
T_VERSION=$(/usr/local/bin/terraform --version | head -1 | cut -d ' ' -f 2 | tail -c +2)
T_RETVAL=${PIPESTATUS[0]}

[[ ${T_VERSION} != ${TERRAFORM_VERSION} ]] || [[ ${T_RETVAL} != 0 ]] \
    && wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/local/bin \
    && rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Install Packer
P_VERSION=$(/usr/local/bin/packer -v)
P_RETVAL=$?

[[ ${P_VERSION} != ${PACKER_VERSION} ]] || [[ ${P_RETVAL} != 1 ]] \
    && wget -q https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
    && unzip packer_${PACKER_VERSION}_linux_amd64.zip \
    && mv packer /usr/local/bin \
    && rm -f packer_${PACKER_VERSION}_linux_amd64.zip

# Clean up
if [ ${REDHAT_BASED} ]; then
    yum clean all
else
    apt-get clean
fi
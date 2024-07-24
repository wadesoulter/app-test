#!/bin/bash

# Update and upgrade the system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install dependencies
sudo apt-get install -y gnupg software-properties-common curl

# Add the HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# Add the official HashiCorp Linux repository
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Update the package list
sudo apt-get update -y

# Install Terraform
sudo apt-get install -y terraform

# Verify the installation
terraform --version

echo "Terraform installation complete!"

# Install Awscli
#!/bin/bash

# Update the package list and install dependencies
sudo apt-get update -y
sudo apt-get install -y unzip curl

# Download the AWS CLI bundle
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the bundle
unzip awscliv2.zip

# Run the install program
sudo ./aws/install

# Verify the installation
aws --version

echo "AWS CLI installation complete!"




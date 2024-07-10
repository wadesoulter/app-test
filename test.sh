#!/bin/bash

# Update package list and upgrade all packages
echo "Updating package list and upgrading all packages..."
sudo yum update -y

# Install Apache
echo "Installing Apache..."
sudo yum install httpd -y

# Start Apache service
echo "Starting Apache service..."
sudo systemctl start httpd

# Enable Apache to start on boot
echo "Enabling Apache to start on boot..."
sudo systemctl enable httpd

echo "Update and Apache installation completed!"

##################################################################

#!/bin/bash

# Function to update and upgrade the system
update_system() {
    echo "Updating package list and upgrading all packages..."
    sudo apt update && sudo apt upgrade -y
}

# Function to install essential packages
install_packages() {
    echo "Installing essential packages: curl, git, vim..."
    sudo apt install -y curl git vim
}

# Function to set up a basic firewall
setup_firewall() {
    echo "Setting up a basic firewall with ufw..."
    sudo apt install -y ufw
    sudo ufw allow OpenSSH
    sudo ufw enable
    echo "Firewall status:"
    sudo ufw status verbose
}

# Function to create a new user and add to sudo group
create_user() {
    read -p "Enter the username of the new user: " username
    sudo adduser $username
    sudo usermod -aG sudo $username
    echo "User $username created and added to the sudo group."
}

# Function to check system status
check_system_status() {
    echo "Checking system status..."
    echo "Disk usage:"
    df -h
    echo "Memory usage:"
    free -h
    echo "Uptime:"
    uptime
}

# Main script execution
update_system
install_packages
setup_firewall
create_user
check_system_status

echo "Basic setup and system checks completed!"

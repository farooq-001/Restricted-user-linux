#!/bin/bash

# Prompt for the username
read -p "Enter the username: " username

# Create the user with a home directory
sudo useradd -m $username

# Prompt for the password (password input will be hidden)
read -sp "Enter the password for $username: " password
echo

# Set the password for the user
echo "$username:$password" | sudo chpasswd

# Change the user's shell to the restricted shell
sudo chsh -s /bin/rbash $username

# Create a bin directory in the user's home directory for allowed commands
sudo mkdir /home/$username/bin

# Create symbolic links for allowed commands
sudo ln -s /bin/df /home/$username/bin/df
sudo ln -s /usr/bin/htop /home/$username/bin/htop
sudo ln -s /bin/ls /home/$username/bin/ls

# Set the PATH to only include the restricted bin directory
echo "export PATH=/home/$username/bin" | sudo tee -a /home/$username/.bashrc

# Set ownership and permissions for the bin directory
sudo chown -R $username:$username /home/$username/bin
sudo chmod 750 /home/$username/bin

echo "User '$username' has been created with restricted access to df -h, htop, and ls -lrth commands."

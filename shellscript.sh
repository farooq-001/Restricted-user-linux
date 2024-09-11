#!/bin/bash

# Create the user with a home directory
sudo useradd -m ch_uk

# Set a password for the user (you can modify the echo command or remove it if you prefer to set the password interactively)
echo "ch_uk:password" | sudo chpasswd

# Change the user's shell to the restricted shell
sudo chsh -s /bin/rbash ch_uk

# Create a bin directory in the user's home directory for allowed commands
sudo mkdir /home/ch_uk/bin

# Create symbolic links for allowed commands
sudo ln -s /bin/df /home/ch_uk/bin/df
sudo ln -s /usr/bin/htop /home/ch_uk/bin/htop
sudo ln -s /bin/ls /home/ch_uk/bin/ls

# Set the PATH to only include the restricted bin directory
echo 'export PATH=/home/ch_uk/bin' | sudo tee -a /home/ch_uk/.bashrc

# Set ownership and permissions for the bin directory
sudo chown -R ch_uk:ch_uk /home/ch_uk/bin
sudo chmod 750 /home/ch_uk/bin

echo "User 'ch_uk' has been created with restricted access to df -h, htop, and ls -lrth commands."

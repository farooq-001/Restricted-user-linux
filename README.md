# Restricted-user-linux
# run
chmod +x shellscript.sh
./shellscript.sh
Enter your Username & Password

# ADD commads "your local user through run this commad to Add remote host commad list"
sudo ln -s /bin/df /home/$username/bin/df
sudo ln -s /usr/bin/htop /home/$username/bin/htop
sudo ln -s /usr/bin/ls /home/$username/bin/ls

# Remove commads "your local user through run this commad to remove remote host commad list"
sudo rm /home/ch_uk/bin/df
sudo rm /home/ch_uk/bin/htop
sudo rm /home/ch_uk/bin/ls

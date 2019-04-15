#!/bin/bash
sudo apt-get update
sudo apt-get install samba -y

sudo adduser user2 --gecos "user2,,," --disabled-password
echo "user2:123456" | sudo chpasswd

sudo mkdir /srv/kozos
sudo chmod 777 /srv/kozos

sudo mkdir /srv/readonly
sudo chmod 755 /srv/readonly

sudo mkdir /srv/user2
sudo chown user2 /srv/user2
sudo chmod 700 /srv/user2

sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.origin
sudo cp ./smb.conf /etc/samba/smb.conf

sudo service smbd restart


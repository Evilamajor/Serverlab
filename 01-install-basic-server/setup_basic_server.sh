#!/bin/bash
# ========================================
# Script: setup_basic_server.sh
# Objectiu: Configuració inicial d'un servidor Ubuntu
# ========================================

echo "🧱 Actualitzant el sistema..."
sudo apt update && sudo apt upgrade -y

echo "🧑‍💻 Creant usuari d'administració..."
sudo adduser adminlab --gecos "Admin Lab,,," --disabled-password
echo "adminlab:Server123!" | sudo chpasswd
sudo usermod -aG sudo adminlab

echo "🌐 Configurant xarxa bàsica..."
hostnamectl set-hostname srv-lab
ip addr show | grep inet

echo "🔒 Instal·lant eines bàsiques de seguretat..."
sudo apt install -y ufw fail2ban openssh-server

echo "Activant tallafoc..."
sudo ufw allow OpenSSH
sudo ufw --force enable

echo "✅ Configuració inicial completada!"

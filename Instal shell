#!/bin/bash

echo "Oblivion telepítés elindult..."

# Frissítjük a csomaglistát
sudo apt update && sudo apt upgrade -y

# Szükséges csomagok telepítése
sudo apt install -y nginx curl unzip git

# Alapértelmezett weboldal fájl létrehozása
echo "<h1>Üdv az Oblivion rendszeren!</h1>" | sudo tee /var/www/html/index.html

# Nginx újraindítása
sudo systemctl restart nginx

echo "Telepítés kész! A szerver fut."

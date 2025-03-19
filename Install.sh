#!/bin/bash

echo "🔹 Oblivion statikus weboldal telepítése..."

# Célkönyvtár létrehozása
WEB_DIR="/var/www/oblivion"
sudo mkdir -p $WEB_DIR
sudo chmod -R 755 $WEB_DIR

# Nginx telepítése és konfigurálása
echo "🔹 Nginx telepítése..."
sudo apt update
sudo apt install -y nginx

# Alap HTML fájl létrehozása
echo "🔹 Statikus fájlok létrehozása..."
cat <<EOF | sudo tee $WEB_DIR/index.html
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oblivion - Előnézet</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background-color: #121212; color: #ffffff; }
        header { background-color: #1e1e1e; padding: 20px; font-size: 24px; font-weight: bold; }
        .container { margin-top: 40px; }
        .feature { background-color: #252525; padding: 20px; margin: 10px auto; width: 80%; border-radius: 10px; }
    </style>
</head>
<body>
    <header>Oblivion Rendszer - Előnézet</header>
    <div class="container">
        <div class="feature">✅ Természetes nyelvi vezérlés</div>
        <div class="feature">✅ Eurojackpot predikciós modul</div>
        <div class="feature">✅ Pénzügyi és kriptovaluta elemzés</div>
        <div class="feature">✅ Dropshipping és üzleti automatizáció</div>
        <div class="feature">✅ Grey Hat biztonsági funkciók</div>
        <div class="feature">✅ Monitoring és önfejlesztés</div>
    </div>
</body>
</html>
EOF

# Nginx konfiguráció beállítása
echo "🔹 Nginx konfiguráció frissítése..."
sudo tee /etc/nginx/sites-available/oblivion <<EOF
server {
    listen 80;
    server_name _;
    root $WEB_DIR;
    index index.html;
    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

# Konfiguráció engedélyezése és újraindítás
sudo ln -s /etc/nginx/sites-available/oblivion /etc/nginx/sites-enabled/
sudo systemctl restart nginx

echo "✅ Oblivion előnézeti weboldal telepítve! Nyisd meg a böngészőben: http://localhost"

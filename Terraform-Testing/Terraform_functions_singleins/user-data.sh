#!/bin/bash
sudo apt-get update
sudo apt-get install nginx -y
sudo apt install git -y
sudo git clone https://github.com/saikiranpi/SecOps-game.git
sudo rm -rf /var/www/html/index.nginx-debian.html
sudo cp SecOps-game/index.html /var/www/html/index.html
echo "<h1>${var.environment}-public-Server-${count.index + 1}</h1>" >> /var/www/html/index.html
sudo systemctl start nginx
sudo systemctl enable nginx
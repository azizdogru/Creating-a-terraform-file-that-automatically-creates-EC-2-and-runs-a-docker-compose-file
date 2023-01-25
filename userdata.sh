#!/bin/bash
apt-get update -y
apt-get upgrade -y
apt install -y docker.io
systemctl start docker
systemctl enable docker
systemctl daemon-reload
systemctl restart docker
# usermod -aG docker ubuntu - ubuntu kısmının user adı ile değiştirilmesi gerekir.
# Openstack'e giriş yapamadığım için kullanıcı adını bilemeyeceğim için bu komutu iptal ettim. kullanıcı adı ubuntu kısmına girilerek komut aktif edilebilir.

# install docker-compose
curl -L "https://github.com/docker/compose/releases/download/v2.15.1/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
apt-get install git -y
hostnamectl set-hostname "docker-compose-server"

cd /home/ # kullanıcı adını bilmediğim için kurulumu doğrudan home klasörüne yapıyorum. 
git clone https://github.com/docker/awesome-compose.git
cd awesome-compose/nginx-flask-mongo/
sudo docker-compose -f compose.yaml up
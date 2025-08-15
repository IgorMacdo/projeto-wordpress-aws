#!/bin/bash
sudo su
EFS_DNS="fs-08768b49a14ef49c8.efs.us-east-2.amazonaws.com"

sudo dnf update -y
sudo dnf install -y nfs-utils docker
sudo systemctl start nfs-utils
sudo systemctl enable nfs-utils

DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker ec2-user
sudo systemctl start docker
sudo systemctl enable docker

sudo mkdir -p /mnt/efs
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${EFS_DNS}:/ /mnt/efs
echo "${EFS_DNS}:/ /mnt/efs nfs4 defaults,tls,_netdev 0 0" | sudo tee -a /etc/fstab

cd /home/ec2-user
cat <<EOF > docker-compose.yml
version: '3.8'

services:
  wordpress:
    image: wordpress:latest
    container_name: wordpress_app
    restart: always
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: rds-wordpress.c5a60wgcgn92.us-east-2.rds.amazonaws.com:3306
      WORDPRESS_DB_USER: admin
      WORDPRESS_DB_PASSWORD: senha1234
      WORDPRESS_DB_NAME: databasewordpress
    volumes:
      - /mnt/efs:/var/www/html
EOF

sudo docker-compose up -d


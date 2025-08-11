#!/bin/bash

# Install additional packages after the container is created
sudo apt-get update -y
sudo apt install -y sl libgpm2 libncurses6

##############################################################
# Install MongoDB (apt-get)
##############################################################

sudo apt-get install gnupg curl
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg \
   --dearmor
echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] http://repo.mongodb.org/apt/debian bookworm/mongodb-org/8.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list
sudo apt-get update -y
sudo apt-get install -y mongodb-org

# Create necessary directories and set permissions
sudo mkdir -p /data/db
sudo chown -R mongodb:mongodb /data/db

# Start MongoDB service
sudo mongod --fork --logpath /var/log/mongodb/mongod.log

##############################################################
# Install MongoDB (manually)
##############################################################

#server
#sudo apt-get install -y libcurl4 libgssapi-krb5-2 libldap-common libwrap0 libsasl2-2 libsasl2-modules libsasl2-modules-gssapi-mit openssl liblzma5
#cd /workspaces/java-copilot-code-agent/
#wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-debian12-8.0.12.tgz
#tar -zxvf mongodb-linux-*-8.0.12.tgz
# sudo cp /workspaces/java-copilot-code-agent/.devcontainer/mongodb-linux-x86_64-debian12-8.0.12/bin/* /usr/local/bin/
#sudo ln -s  /workspaces/java-copilot-code-agent/.devcontainer/mongodb-linux-x86_64-debian12-8.0.12/bin/* /usr/local/bin/


#wget https://downloads.mongodb.com/compass/mongosh-2.5.6-linux-arm64.tgz
#tar -zxvf mongosh-2.5.6-linux-arm64.tgz
#chmod +x /workspaces/java-copilot-code-agent/.devcontainer/mongosh-2.5.6-linux-arm64/bin/mongosh
#sudo cp workspaces/java-copilot-code-agent/.devcontainer/mongosh-2.5.6-linux-arm64/bin/mongosh/mongosh /usr/local/bin/
#sudo cp workspaces/java-copilot-code-agent/.devcontainer/mongosh-2.5.6-linux-arm64/bin/mongosh/mongosh_crypt_v1.so /usr/local/lib/
#sudo ln -s /workspaces/java-copilot-code-agent/.devcontainer/mongosh-2.5.6-linux-arm64/bin/* /usr/local/bin/

#wget https://repo.mongodb.org/apt/debian/dists/bookworm/mongodb-org/8.0/main/binary-amd64/mongodb-org-server_8.0.12_amd64.deb
#sudo apt install -y ./mongodb-org-server_8.0.12_amd64.deb
#sudo dpkg -i 

#sudo groupadd mongodb
#sudo useradd -r -g mongodb -s /bin/false mongodb

## Create necessary directories and set permissions
#sudo mkdir -p /data/db
#sudo mkdir -p /var/log/mongodb
#sudo chown -R mongodb:mongodb /data/db
#sudo chown -R mongodb:mongodb /var/log/mongodb

## Start MongoDB service
#sudo mongod --dbpath /data/db --logpath /var/log/mongodb/mongod.log --fork

#echo "MongoDB has been installed and started successfully!"
mongod --version

# Run sample MongoDB commands
echo "Current databases:"
mongosh --eval "db.getMongo().getDBNames()"

cd /workspaces/java-copilot-code-agent/
mvn clean compile
mvn test
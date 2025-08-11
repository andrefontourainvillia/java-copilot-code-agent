#!/bin/bash

# Install additional packages after the container is created
sudo apt-get update -y
sudo apt install -y sl libgpm2 libncurses6

# Install MongoDB
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

echo "MongoDB has been installed and started successfully!"
mongod --version

# Run sample MongoDB commands
echo "Current databases:"
mongosh --eval "db.getMongo().getDBNames()"
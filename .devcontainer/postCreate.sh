#!/bin/bash

# Install additional packages after the container is created
sudo apt-get update -y
sudo apt install -y sl libgpm2 libncurses6

# Install MongoDB (apt-get)
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

mongod --version

# Run sample MongoDB commands
echo "Current databases:"
mongosh --eval "db.getMongo().getDBNames()"

# Setup Java environment
echo "Setting up Java development environment..."

# Create VS Code directories if they don't exist
mkdir -p .vscode

# Build the project to ensure all dependencies are downloaded
echo "Building project..."
mvn clean install -DskipTests

# Setup debug and test environment
echo "Setting up debug and test environment..."

# Update Java configurations
echo "Updating Java configurations..."
touch .vscode/launch.json
touch .vscode/settings.json
touch .vscode/tasks.json

# Setup environment variables for development
export SPRING_PROFILES_ACTIVE=dev

echo "Development environment setup complete!"
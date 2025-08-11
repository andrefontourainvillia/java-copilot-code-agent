# Install additional packages after the container is created
sudo apt-get update -y
sudo apt install -y sl libgpm2 libncurses6

# Prepare MongoDB Dev DB
chmod +x /workspaces/java-copilot-code-agent/.devcontainer/installMongoDB.sh
/workspaces/java-copilot-code-agent/.devcontainer/installMongoDB.sh
#!/bin/bash
# This file should be stored at /home/production/apicenter

# LOG_DIR="/var/log"
# LOG_FILE="$LOG_DIR/APICenter.log"

# # Create the directory if it doesn't exist
# mkdir -p "$LOG_DIR"

# # Create an empty file or do nothing if it already exists
# touch "$LOG_FILE"

# # Grant read and write permissions to everybody
# chmod a+rw "$LOG_FILE"

# create db folder for docker
DATA_DIR="/db/data"

# Create the directory if it doesn't exist
mkdir -p "$DATA_DIR"

# Check if Docker is installed
if command -v docker &> /dev/null; then
    echo "Docker is already installed."
else
    # Install Docker
    echo "Docker is not installed. Installing Docker..."

    # Update package index
    sudo apt update

    # Install required dependencies
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

    # Add Docker GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Set up stable Docker repository
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update package index again
    sudo apt update

    # Install Docker
    sudo apt install -y docker-ce docker-ce-cli containerd.io

    echo "Docker installed successfully."
fi

# install pkgs
sudo apt update
sudo apt install -y maven
mvn --version

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions
sudo chmod +x /usr/local/bin/docker-compose



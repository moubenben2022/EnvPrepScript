#!/bin/bash
# this file should be stored at /home/production/apicenter

#!/bin/bash

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

# Check Docker version
docker --version

docker pull mingming20200202/apicenter:latest

docker tag docker.io/mingming20200202/apicenter:latest apicenter:latest

docker stop apicenter

docker rm apicenter

# adjust to prts in APICenter/src/main/resources/application.yml
# docker run -p host_port_1:container_port_1 -p host_port_2:container_port_2 -p host_port_3:container_port_3
# docker run -v /path/on/host:/path/in/container image_name
docker run --name apicenter -v "$LOG_PATH":"$LOG_PATH"  -p 12311:12311 -p 12312:12312 -d apicenter:latest

docker image prune -

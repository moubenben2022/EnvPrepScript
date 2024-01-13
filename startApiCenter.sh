#!/bin/bash
# this file should be stored at /home/production/apicenter

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

docker image prune

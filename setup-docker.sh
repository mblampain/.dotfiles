# Install Docker
curl -fsSL https://get.docker.com | sudo bash

# Add user to docker group
sudo groupadd docker && sudo usermod -aG docker $USER && newgrp docker

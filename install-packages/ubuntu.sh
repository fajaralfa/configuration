#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install wget cmake ninja vim tmux git -y

# install brave browser
curl -fsS https://dl.brave.com/install.sh | sh

# install llvm
bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

# install pixi
curl -fsSL https://pixi.sh/install.sh | sh
eval "$(pixi completion --shell bash)"

# install nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash

# install docker engine
# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

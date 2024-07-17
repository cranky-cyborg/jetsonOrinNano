#!/bin/bash

#Below is a placeholder if the user opts to remove sudo from asking password (only in terminal)
#{remove-sudo-password}echo " 
#{remove-sudo-password}${USER} ALL=(ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo;

#Below is a placeholder for Docker.sock permission issue
#{docker-sock}sudo chmod 666 /var/run/docker.sock;
PWD=$(pwd)
#download pytorch & tensorflow from nvidia developer website
mkdir $HOME/nvidia
cd $HOME/nvidia

#manually check if this is the latest
wget https://developer.download.nvidia.com/compute/redist/jp/v60/pytorch/torch-2.4.0a0+f70bd71a48.nv24.06.15634931-cp310-cp310-linux_aarch64.whl

wget https://developer.download.nvidia.com/compute/redist/jp/v60/tensorflow/tensorflow-2.16.1+nv24.06-cp310-cp310-linux_aarch64.whl

pip install --upgrade pip

sudo apt install libhdf5-dev

pip install tensorflow-2.16.1+nv24.06-cp310-cp310-linux_aarch64.whl

pip install torch-2.4.0a0+f70bd71a48.nv24.06.15634931-cp310-cp310-linux_aarch64.whl

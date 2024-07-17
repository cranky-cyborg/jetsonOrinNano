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

python3.10 -m pip install --upgrade pip
python3.10 -m pip install --upgrade setuptools
python3.10 -m pip install --upgrade wheel
python3.10 -m pip install virtualenv
sudo apt install python3.10-venv
python3.10 -m venv myENV --system-site-packages
source ~/myENV/bin/activate
cd myENV
python3.10 -m pip install --upgrade 'numpy<1.25.0'
python3.10 -m pip install onnx
#manually check if this is the latest
wget https://developer.download.nvidia.com/compute/redist/jp/v60/pytorch/torch-2.4.0a0+07cecf4168.nv24.05.14710581-cp310-cp310-linux_aarch64.whl

wget https://developer.download.nvidia.com/compute/redist/jp/v60/tensorflow/tensorflow-2.16.1+nv24.06-cp310-cp310-linux_aarch64.whl

sudo apt install libhdf5-dev

python3.10 -m pip install torch-2.4.0a0+07cecf4168.nv24.05.14710581-cp310-cp310-linux_aarch64.whl

#Test is torch has installed properly
python3.10 -c "import torch;print(torch.cuda.is_available())"

python3.10 -m pip install tensorflow-2.16.1+nv24.06-cp310-cp310-linux_aarch64.whl



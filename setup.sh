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



#Test is torch has installed properly
python3.10 -c "import torch;print(torch.cuda.is_available())"

python3.10 -m pip install tensorflow-2.16.1+nv24.06-cp310-cp310-linux_aarch64.whl
#test Tensorflow install, GPU count should be 1, ignore warnings.
python3.10 -c "import tensorflow as tf;print(len(tf.config.list_physical_devices('GPU')))"


python3.10 -m pip install ultralytics

#ultralytics will uninstall Torch, we need to restore it.
#uninstall torch 2.3 installed by ultralytics
python3.10 -m pip uninstall torch torchvision

#install torch from downloaded package
python3.10 -m pip install torch-2.4.0a0+07cecf4168.nv24.05.14710581-cp310-cp310-linux_aarch64.whl

#install torchvision from code.
git clone https://github.com/pytorch/vision torchvision
cd torchvision
export USE_CUDA=1 USE_CUDNN=1 USE_MKLDNN=1 TORCH_CUDA_ARCH_LIST="8.7" FORCE_CUDA=1 FORCE_MPS=1
sudo apt-get -y install ffmpeg libavutil-dev libavcodec-dev libavformat-dev libavdevice-dev libavfilter-dev libswscale-dev libswresample-dev libswresample-dev libpostproc-dev libjpeg-dev libpng-dev libopenblas-base libopenmpi-dev

python3.10 -m pip install ninja ffmpeg pynvjpeg
python3.10 setup.py install

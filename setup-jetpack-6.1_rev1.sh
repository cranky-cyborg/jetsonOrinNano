#!/bin/bash

#below line suppresses requests for sudo passwords
echo " 
${USER} ALL=(ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo;

#capturing the current working directory
PWD=$(pwd)

#update packages
apt update && apt upgrade

#installing pip
apt install python3-pip && python3-venv


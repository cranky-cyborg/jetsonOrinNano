#!/bin/bash

#Below is a placeholder if the user opts to remove sudo from asking password (only in terminal)
#{remove-sudo-password}echo " 
#{remove-sudo-password}${USER} ALL=(ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo;

#Below is a placeholder for Docker.sock permission issue
#{docker-sock}sudo chmod 666 /var/run/docker.sock;



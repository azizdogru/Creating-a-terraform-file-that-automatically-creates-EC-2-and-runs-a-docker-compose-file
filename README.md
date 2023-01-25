# Creating-a-terraform-file-that-automatically-creates-EC-2-and-runs-a-docker-compose-file

This terraform file;

1. Creating a EC-2 running Ubuntu 20.04. Only ssh(22) port is added as ingress security group. 
2. The userdata.sh file firstly installs the docker and docker-compose files, and then downloads the repo containing nginx-flask-mongo from https://github.com/docker/awesome-compose/tree/master/nginx-flask-mongo to autostart it.

In other words, these steps run automatically with first-boot without manual intervention.

#!/bin/bash

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

docker run --name ubuntu -d pycontribs/ubuntu sleep 10000
docker run --name centos7 -d pycontribs/centos:7 sleep 10000
docker run --name fedora -d pycontribs/fedora sleep 10000

ansible-playbook -i inventory/prod.yml --vault-pass-file secret site.yml

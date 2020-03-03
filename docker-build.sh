#!/usr/bin/env bash

# COLOQUE AQUI SEU USUARIO DOCKERHUB
dockerhub_user=eaojunior

image_name=proxy
image_version=1.0.0
container_name=squid_proxy

docker build --no-cache -t ${dockerhub_user}/${image_name}:${image_version} . 

docker tag ${dockerhub_user}/${image_name}:${image_version} ${dockerhub_user}/${image_name}:latest

docker push ${dockerhub_user}/${image_name}:${image_version}
docker push ${dockerhub_user}/${image_name}:latest
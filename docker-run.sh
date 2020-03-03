#!/usr/bin/env bash

# COLOQUE AQUI SEU USUARIO DOCKERHUB
dockerhub_user=eaojunior

# Not change
image_name=proxy
image_version=1.0.0

# Port
proxy_port=3128
# Container Name
container_name=squid_proxy

docker rm -f ${container_name}

docker run -p ${proxy_port}:3128 \
    --rm --name ${container_name} \
    -it \
    ${dockerhub_user}/${image_name}:${image_version}

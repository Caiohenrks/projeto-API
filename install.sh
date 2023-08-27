#!/bin/bash
image_name="projetoapi:lts"
container_name="projetoapi"

if docker container inspect "$container_name" &> /dev/null; then
    echo "Removendo contêiner existente: $container_name"
    docker container stop "$container_name"
    docker container rm "$container_name"
fi

if docker image inspect "$image_name" &> /dev/null; then
    echo "Removendo imagem existente: $image_name"
    docker image rm "$image_name"
fi

echo "Construindo imagem: $image_name"
docker build -t "$image_name" .

echo "Iniciando contêiner: $container_name"
docker run -d --name "$container_name" -p 80:80 "$image_name"


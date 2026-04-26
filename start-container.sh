#!/bin/bash

set -e

IMAGE_NAME="dev-ai"
CONTAINER_NAME="dev-ai"
WORKSPACE="$HOME/workspace"
OLLAMA_VOLUME="ollama_data"

run_container() {
  docker run -it \
    --name $CONTAINER_NAME \
    --gpus all \
    -p 11434:11434 \
    -v $WORKSPACE:/workspace \
    -v $OLLAMA_VOLUME:/root/.ollama \
    -w /workspace \
    $IMAGE_NAME
}

case "$1" in

  build)
    docker build -t $IMAGE_NAME .
    ;;

  run)
    if [ "$(docker ps -a -q -f name=$CONTAINER_NAME)" ]; then
      docker rm -f $CONTAINER_NAME
    fi
    run_container
    ;;

  start)
    if [ "$(docker ps -a -q -f name=$CONTAINER_NAME)" ]; then
      docker start $CONTAINER_NAME >/dev/null 2>&1
      docker exec -it $CONTAINER_NAME bash
    else
      run_container
    fi
    ;;

  exec)
    docker exec -it $CONTAINER_NAME bash
    ;;

  stop)
    docker stop $CONTAINER_NAME
    ;;

  remove)
    docker rm -f $CONTAINER_NAME
    ;;

  logs)
    docker logs -f $CONTAINER_NAME
    ;;

  status)
    docker ps -a -f name=$CONTAINER_NAME
    ;;

  *)
    echo "Usage: $0 {build|run|start|exec|stop|remove|logs|status}"
    ;;

esac
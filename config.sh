#!/bin/bash

# Command used to launch docker
DOCKER_CMD="`which docker`"

# Where to store the backups
BACKUP_PATH=""

# Where to store the communication pipes
FIFO_PATH="/tmp/docker-things/fifo"

# The name of the docker image
PROJECT_NAME="postman"

# BUILD ARGS
BUILD_ARGS=(
    --build-arg DOWNLOAD_URL="https://dl.pstmn.io/download/latest/linux64"
    )

# LAUNCH ARGS
RUN_ARGS=(
    -e DISPLAY=$DISPLAY
    -v /tmp/.X11-unix:/tmp/.X11-unix

    --memory="1g"
    --cpu-shares=1024

    -v $(pwd)/data:/home/$(whoami)

    --rm
    -d
    )

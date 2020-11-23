#! /bin/bash

NAME="constr"
PORT="10001:8787"

docker build . -t $NAME

docker run -d --name $NAME \
    --volume $PWD/share/:/home/$NAME:ro \
    --volume $PWD/xinetd:/etc/xinetd.d/$NAME:ro \
    -p $PORT \
    $NAME

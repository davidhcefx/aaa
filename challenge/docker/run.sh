#! /bin/bash

NAME="constr"
PORT="80:8787"

# copy binary
cp ../$NAME share/$NAME

# build
docker build . -t $NAME

# run
docker run -d --name $NAME \
    --volume $PWD/share/:/home/$NAME:ro \
    --volume $PWD/xinetd:/etc/xinetd.d/$NAME:ro \
    -p $PORT \
    $NAME

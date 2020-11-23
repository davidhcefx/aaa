#! /bin/bash

name="constr"
ports="80:8787"

# copy binary
cp ../$name share/$name

# build
docker build . -t $name

# run
docker run -d --name $name \
    --volume $PWD/share/:/home/$name:ro \
    --volume $PWD/xinetd:/etc/xinetd.d/$name:ro \
    -p $ports \
    $name

echo "done"

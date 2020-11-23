#! /bin/bash

name="constr"
ports="80:80"

echo "copy"

# copy binary
cp ../$name share/$name

echo "building"

# build
docker build . -t $name

# run
docker run -d --name $name \
    --volume $PWD/share/:/home/$name:ro \
    --volume $PWD/xinetd:/etc/xinetd.d/$name:ro \
    -p $ports \
    $name

echo "done"

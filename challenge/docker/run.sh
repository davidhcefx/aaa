#! /bin/bash

name="constr"
ports="80:80"


dockerd -H fd:// --containerd=/run/containerd/containerd.sock &

# copy binary
cp ../$name share/$name

# build
echo "building"
docker build . -t $name

# run
docker run -d --name $name \
    --volume $PWD/share/:/home/$name:ro \
    --volume $PWD/xinetd:/etc/xinetd.d/$name:ro \
    -p $ports \
    $name

echo "done"

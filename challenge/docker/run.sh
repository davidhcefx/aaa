#! /bin/bash

name="constr"
ports="80:80"

ls /app/vendor
ls /app/vendor/docker
/app/vendor/docker/docker/dockerd -H fd:// --containerd=/run/containerd/containerd.sock &

# copy binary
cp ../$name share/$name

docker build . -t $name

docker run -d --name $name \
    --volume $PWD/share/:/home/$name:ro \
    --volume $PWD/xinetd:/etc/xinetd.d/$name:ro \
    -p $ports \
    $name

echo "done"

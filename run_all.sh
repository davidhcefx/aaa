#! /bin/bash

for d in */docker; do
    echo "Starting $d..."
    cd "$d"
    ./run.sh
    cd -
done

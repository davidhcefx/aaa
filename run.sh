#! /bin/bash

server=/home/user/constr

worker() {
    while true; do
        file=/tmp/fifo_$RANDOM
        rm -f $file
        mkfifo $file
        nc -v -l -p $PORT <$file | "$server" &>$file
    done
}

main() {
    worker &
    worker &
    worker
}

main

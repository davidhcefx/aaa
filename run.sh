#! /bin/bash

file=/tmp/fifo_$RANDOM
server=/home/user/constr

mkfifo $file
echo "Listening on port $PORT..."
nc -v -l -p $PORT <$file | $server &>$file
rm $file
echo "done"

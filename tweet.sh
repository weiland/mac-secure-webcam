#!/usr/bin/env sh

set -ex

IMAGE_DIR=~/Pictures/.isight
IMAGE=$(ls "$IMAGE_DIR"/* -t1 |  head -n 1)


~/.gem/ruby/2.6.0/bin/t update -f=$IMAGE "$(date)" >> /tmp/tweet.log
if [ $? -eq "1" ]; then
  echo "tweet error"
else
  echo 'tweeted'
  rm $IMAGE_DIR/*.jpg
fi


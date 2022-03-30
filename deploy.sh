#!/usr/bin/env sh

set -ex

IMAGE_DIR=~/Pictures/.isight
IMAGE_NAME=$(date +%Y%m%d_%H-%M-%S)-webcam.jpg
IMAGE="$IMAGE_DIR/$IMAGE_NAME"

HOST=y
REMOTE_DIR=selfies/

# take snapshot from webcam
/opt/homebrew/bin/imagesnap -v -w 1 "$IMAGE"

# upload image(s)
/usr/bin/scp -v $IMAGE_DIR/* $HOST:$REMOTE_DIR 2>> /tmp/hourlyImageSCP.log

# evaluate upload result
if [ $? -eq "1" ]; then
   echo "upload error"
# else
  # tweet image
  # ~/.gem/ruby/2.6.0/bin/t update -f=$IMAGE "$(date)" >> /tmp/tweet.log
  # if [ $? -eq "1" ]; then
  #   echo "tweet error"
  # else
  #   echo 'tweeted'
  #   # remove image if uploaded and tweeted successfully
  #   rm $IMAGE_DIR/*.jpg
  # fi
fi


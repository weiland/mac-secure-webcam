#!/usr/bin/env sh

IMAGE_DIR=~/Pictures/.isight
IMAGE_NAME=$(date +%Y%m%d_%H-%M-%S)-webcam.jpg
IMAGE="$IMAGE_DIR/$IMAGE_NAME"

HOST=u.seeh.in
REMOTE_DIR=pic/

# take snapshot from webcam
/usr/local/bin/imagesnap -v -w 1 "$IMAGE"

# upload image(s)
/usr/bin/scp -v $IMAGE_DIR/* $HOST:$REMOTE_DIR 2>> /tmp/hourlyImageSCP.log

# evaluaate upload result
if [ $? -eq "1" ]; then
   echo "upload error"
else
  # tweet image
  ~/.rbenv/shims/t update -f=$IMAGE "$(date)"
  if [ $? -eq "1" ]; then
    echo "tweet error"
  else
    echo 'tweeted'
    # remove image if uploaded and tweeted successfully
    rm $IMAGE_DIR/*.jpg
  fi
fi


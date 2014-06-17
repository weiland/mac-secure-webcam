#!/bin/bash

# take a webcam image and a screenshot (add /usr/sbin/ prefix when you run it as cronjob)
isightcapture -w 640 -h 480 -t jpg ~/Pictures/isight/$(date +%Y%m%d_%H-%M-%S)-webcam.jpg
screencapture -C -m -t jpg -x ~/Pictures/isight/$(date +%Y%m%d_%H-%M-%S)-screenshot.jpg

# upload it to my lovely server (i use ubersapce) (perhaps /usr/bin/ prefix required)
scp ~/Pictures/isight/* user@server:"pic/"
#if [ $? -eq "1" ]; then # on ssh error (no internet)
#else # no error
#fi
# delete local (so no one discovers these images)
rm -f ~/Pictures/isight/*.jpg

# consider of deleting old images on the server (only when there was no error)

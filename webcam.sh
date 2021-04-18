#!/bin/bash

PATH=$PATH:/home/pi/.local/bin

IMGDIR="/var/www/html/webcam"

function snap {
  raspistill  \
  --quality 40 \
  --width 1280 \
  --height 720 \
  --rotation 270 \
  --exif EXIF.DateTimeOriginal \
  --output ${IMGFILE} 
}

while true
do
  EPOCH=$(date +%s)
  IMGFILE="${IMGDIR}/${EPOCH}.jpg"
  snap
  #aws s3 cp ${IMGDIR}/${EPOCH}.jpg s3://8450enterprise/test/ 
  mv ${IMGFILE} ${IMGDIR}/picam0.jpg
  sleep 600
done


#/usr/bin/env bash

FRAME_RATE=24

WIDTH=470
HEIGHT=-1

AUDIO="sound/mixed/final.ogg"
GIF="image/box.gif"
OUTPUT="final/merged.mp4"

# convert video to gif
# ffmpeg -i $VIDEO  $GIF -hide_banner

# if you have a list of pictures to create GIF
# convert -delay 20 -loop 0 *.jpg output.gif

# merge gif and audio
ffmpeg -i $AUDIO -ignore_loop 0 -i $GIF -r $FRAME_RATE -vf scale=$WIDTH:$HEIGHT,pad=$WIDTH:0:0:60:black -filter:v "crop=in_w:in_h-40" -shortest -strict -2 -c:v libx264 -threads 8 -c:a aac -b:a 192k -pix_fmt yuv420p -shortest $OUTPUT

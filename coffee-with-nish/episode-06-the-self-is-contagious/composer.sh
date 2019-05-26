#/usr/bin/env bash


FRAME_RATE=24
WIDTH=640
HEIGHT=-1
AUDIO="audio/audio.3gpp"
VIDEO="image/spiral-zoom.mp4"
OUTPUT="final/merged.mp4"

# merge video and audio

ffmpeg -y -i $AUDIO -i $VIDEO -r $FRAME_RATE -vf scale=$WIDTH:$HEIGHT,pad=$WIDTH:0:0:60:black -filter:v "crop=in_w:in_h-40" -shortest -strict -2 -c:v libx264 -threads 8 -c:a aac -b:a 192k -pix_fmt yuv420p $OUTPUT

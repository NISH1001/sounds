#/usr/bin/env bash


AUDIO="audio/choices.mp3"
VIDEO="image/fractal-tree.mp4"
OUTPUT="final/merged.mp4"

ffmpeg -i $VIDEO -i $AUDIO $OUTPUT

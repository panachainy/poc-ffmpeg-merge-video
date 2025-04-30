#!/bin/bash

intro="intro.mp4"
output_dir="output"

mkdir -p "$output_dir"

for video in real_videos/*.mp4; do
    filename=$(basename "$video")
    ffmpeg -i "$intro" -i "$video" \
    -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0]concat=n=2:v=1:a=1[outv][outa]" \
    -map "[outv]" -map "[outa]" "$output_dir/$filename"
done

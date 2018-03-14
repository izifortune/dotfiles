#!/bin/bash

# Generates a cover image along with mute web-ready WebM and MP4 files for each master video in a folder.
# See: https://gist.github.com/jaydenseric/220c785d6289bcfd7366.

# Parameter 1: Input video format (e.g. "mov").
# Parameter 2: Output width in pixels (e.g. "1280").
# Example use: "./video4web.sh mov 1280".

for i in *.$1
do
  # Generate cover image
  ffmpeg -i $i -vframes 1 -vf scale=$2:-2 -q:v 1 ${i%$1}jpg
done

for file in *
do
  echo $file
  echo ${file: -4} 
  if [[ ${file: -4} == ".gif" ]]; then
    ffmpeg -i $file -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" "$file.mp4"
    ffmpeg -i $file -c vp9 -b:v 0 -crf 41 "$file.webm"
  fi
done

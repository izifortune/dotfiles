 # ffmpeg -i $1 -vcodec libx265 -crf 28 $1.updated.mp4
cd original
for file in *.mp4
do
  # ffmpeg -i $file -c:v libx264 -preset slow -crf 23 -tune stillimage -c:a copy ../$file.tune23.mp4
  # ffmpeg -i $file -c:v libx264 -preset slow -crf 28 -tune stillimage -c:a copy ../$file.tune28.mp4
  # ffmpeg -i $file -c:v libx264 -preset slow -crf 17 -tune stillimage -c:a copy ../$file.tune17.mp4
  # ffmpeg -i $file -c:v libx264 -preset slow -crf 17 -c:a copy ../$file.17.mp4
  # ffmpeg -i $file -c:v libx264 -preset slow -crf 23 -c:a copy ../$file.23.mp4
  # ffmpeg -i $file -c:v libx264 -preset slow -crf 23 -c:a copy ../$file.28.mp4
  ffmpeg -i $file -c:v libx264 -preset slow -crf 28 -tune stillimage -vf scale=964:-2 -c:a copy ../$file.tunescaled96428.mp4
  ffmpeg -i $file -c:v libx264 -preset slow -crf 23 -tune stillimage -vf scale=964:-2 -c:a copy ../$file.tunescaled96423.mp4
  ffmpeg -i $file -c:v libx264 -preset slow -crf 17 -tune stillimage -vf scale=964:-2 -c:a copy ../$file.tunescaled96417.veryslow.mp4
  ffmpeg -i $file -c:v libx264 -preset slow -crf 28 -tune stillimage -vf scale=1160:-2 -c:a copy ../$file.tunescaled116028.mp4
  ffmpeg -i $file -c:v libx264 -preset slow -crf 23 -tune stillimage -vf scale=1160:-2 -c:a copy ../$file.tunescaled116023.mp4
  ffmpeg -i $file -c:v libx264 -preset slow -crf 17 -tune stillimage -vf scale=1160:-2 -c:a copy ../$file.tunescaled116017.veryslow.mp4
   # ffmpeg -i $file -c:v libx264 -preset veryslow -crf 23 -tune stillimage -c:a copy ../$file.tune23.veryslow.mp4
   # ffmpeg -i $file -c:v libx264 -preset veryslow -crf 28 -tune stillimage -c:a copy ../$file.tune28.veryslow.mp4
   # ffmpeg -i $file -c:v libx264 -preset veryslow -crf 17 -tune stillimage -c:a copy ../$file.tune17.veryslow.mp4
   # ffmpeg -i $file -c:v libx264 -preset veryslow -crf 17 -c:a copy ../$file.17.veryslow.mp4
   # ffmpeg -i $file -c:v libx264 -preset veryslow -crf 23 -c:a copy ../$file.23.veryslow.mp4
   # ffmpeg -i $file -c:v libx264 -preset veryslow -crf 23 -c:a copy ../$file.28.veryslow.mp4
   ffmpeg -i $file -c:v libx264 -preset veryslow -crf 28 -tune stillimage -vf scale=964:-2 -c:a copy ../$file.tunescaled96428.veryslow.mp4
   ffmpeg -i $file -c:v libx264 -preset veryslow -crf 23 -tune stillimage -vf scale=964:-2 -c:a copy ../$file.tunescaled96423.veryslow.veryslow.mp4
   ffmpeg -i $file -c:v libx264 -preset veryslow -crf 17 -tune stillimage -vf scale=964:-2 -c:a copy ../$file.tunescaled96417.veryflow.mp4
   ffmpeg -i $file -c:v libx264 -preset veryslow -crf 28 -tune stillimage -vf scale=1160:-2 -c:a copy ../$file.tunescaled116028.veryslow.mp4
   ffmpeg -i $file -c:v libx264 -preset veryslow -crf 23 -tune stillimage -vf scale=1160:-2 -c:a copy ../$file.tunescaled116023.veryslow.veryslow.mp4
   ffmpeg -i $file -c:v libx264 -preset veryslow -crf 17 -tune stillimage -vf scale=1160:-2 -c:a copy ../$file.tunescaled116017.veryflow.mp4
done

# Handy Commands
Just a handful of things I've found useful over time

### Exporting GIFs from preview
Sometimes I edit gifs in macOS preview, but saving seems to break the looping behavior. To fix that I used `imagemagick` `convert` (`brew install imagemagick`)
```
❯ convert -loop 0 {source.gif} {destination.gif}
```


### Converting Video to GIF
Handy command to convert videos to gif so I can put them in github descriptions and comments (at 1/5th time, `setpts=0.2*PTS`)
```
ffmpeg -i {input_video} -pix_fmt rgb24 -loop 0 -filter:v "setpts=0.2*PTS" {output_name}.gif
```

### Combining GIFs
I was messing around trying to combine a GIF with a static background and found that if the gif I wanted to layer disposed frames I needed to do some 
tweaking to the `convert` command
```
convert {background.png} null: \( {source.gif} -coalesce \) -set dispose previous -layers composite -layers optimize {output.gif}
```
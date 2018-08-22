
# How to Manipulate Gif Frames with ffmpeg

## Screen recording a gif on Linux

I have found [Peek](https://github.com/phw/peek) to be an easy gif-screen-recorder.

[Install](https://github.com/phw/peek#installation) Peek on Ubuntu with: 

```shell
sudo add-apt-repository ppa:peek-developers/stable
sudo apt update
sudo apt install peek
```

Also, install ffmpeg:

```shell
sudo apt install ffmpeg
```

## Extract image stills from gif

[This article](https://www.bugcodemaster.com/article/extract-images-frame-frame-video-file-using-ffmpeg) discusses how to extract still image frames from a gif using ffmpeg.

Use:

```shell
ffmpeg -i input.gif frame%04d.png
```

extractor.sh source:

```shell
namenogif=$(echo $1 | sed 's;\(.*\)\.\(.*\);\1;' | sed 's;/;\n;g' | tail -n 1)
mkdir -p $namenogif
ffmpeg -i $1 $namenogif/$namenogif-frame%04d.png
framecount=$(ls $namenogif | grep -e $namenogif-frame | wc -l)
echo ""
echo "Extracted" $framecount "frames to" $(pwd)/$namenogif
```

## Speed up gif by deleting frames

To delete frames with a pattern, use the solution from [this stack overflow](https://stackoverflow.com/questions/12604366/how-to-delete-every-other-file-in-a-directory-from-a-shell-command):

Dry run:

```shell
ls *.png | awk 'NR % 10 != 0 { print }' 
```

Actually delete:

```shell
ls *.png | awk 'NR % 10 != 0 { print }' | xargs rm
```

## Re-animate frames as a sped-up gif

unfinished :(




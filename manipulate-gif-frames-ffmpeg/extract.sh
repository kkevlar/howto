#!/bin/sh

namenogif=$(echo $1 | sed 's;\(.*\)\.\(.*\);\1;' | sed 's;/;\n;g' | tail -n 1)
mkdir -p $namenogif
ffmpeg -i $1 $namenogif/$namenogif-frame%04d.png
framecount=$(ls $namenogif | grep -e $namenogif-frame | wc -l)
echo ""
echo "Extracted" $framecount "frames to" $(pwd)/$namenogif

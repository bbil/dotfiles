#!/usr/bin/env bash
# this needs i3lock, scrot and convert

icon="$HOME/Pictures/icon.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 20% -scale 500% "$tmpbg"
# convert "$tmpbg" -blur 1x2 "$tmpbg"
i3lock -i "$tmpbg" -u


#!/bin/bash

wallpapers=~/.config/wallpapers/*

while true; do
    feh --randomize --bg-max ${wallpapers}
    sleep 30m
done

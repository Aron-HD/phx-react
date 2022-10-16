#!/usr/bin/env bash

path="./priv/static/webapp"

mkdir -p "$path/dist" &&
  rm -rf "$path/dist" &&
  cp -a "./frontend/dist" $path 

echo "./frontend/dist -> $path" 

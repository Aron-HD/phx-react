#!/usr/bin/env bash

path="./priv/static/webapp"

mkdir -p $path &&
  rm -rf "$path/dist" &&
  cp -a "./frontend/dist" $path 

echo "./frontend/dist -> $path" 

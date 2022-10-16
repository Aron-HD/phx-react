#!/usr/bin/env bash

public_path="./priv/static/webapp"

rm -rf $public_path && 
mkdir -p $public_path && 
cp -pr "./frontend/dist/" $public_path  &&
echo "./frontend/dist/ -> $public_path"
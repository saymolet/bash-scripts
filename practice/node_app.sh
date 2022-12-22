#!/bin/bash

WGET_LINK="https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"
TMP_FILE=`mktemp`

# Prepare env, Install all tools
apt update

echo "Installing Node.js, npm, curl, wget, net-tools"

apt install -y nodejs npm curl net-tools

# display NodeJS version
node_version=$(node --version)
echo "NodeJS version "$node_version" installed"

# display npm version
npm_version=$(npm --version)
echo "NPM version "$npm_version" installed"

# download tar, save to a temp file, unzip it, delete temp file
wget "$WGET_LINK" -O $TMP_FILE
tar -xvf $TMP_FILE

# set env variables required
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

# cd to working dir
cd package 

# install app dependencies
npm install

# start the node.js app in the background
node server.js &

# print node processes, ignore grep
ps aux | grep node | grep -v grep












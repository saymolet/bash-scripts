#!/bin/bash

WGET_LINK="https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"
TMP_FILE=`mktemp`
BGreen='\033[1;32m' # Green
NC='\033[0m'        # No Color
RED='\033[0;31m'    # Red

# Prepare env, Install all tools
apt update

echo "Installing Node.js, npm, curl, wget, net-tools"

apt install -y nodejs npm curl net-tools

# display NodeJS version
node_version=$(node --version)
echo -e "${BGreen}NodeJS version "$node_version" installed${NC}"

# display npm version
npm_version=$(npm --version)
echo -e "${BGreen}NPM version "$npm_version" installed${NC}"

# download tar, save to a temp file, unzip it, delete temp file
wget "$WGET_LINK" -O $TMP_FILE
tar -xvf $TMP_FILE



read -e -p "Set log directory location for the application (absolute path): " LOG_DIR

if [ -d "$LOG_DIR" ]; then
  export LOG_DIR="$LOG_DIR"
  echo -e "${BGreen}$LOG_DIR exported${NC}"
else
  mkdir -p "$LOG_DIR"
  export LOG_DIR="$LOG_DIR"
  echo -e "${BGreen}$LOG_DIR created and exported${NC}"
fi

# set env variables required
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

# cd to working dir
cd package 

# install app dependencies
# npm install

# start the node.js app in the background
# node server.js &

# print node processes, ignore grep
ps aux | grep node | grep -v grep

sleep 2

# show what port app is listening
netstat -ltnp | grep ::3000

if [ "$?" == 0 ]; then
  echo -e "${BGreen}App is launched and ready!${NC}"
else
  echo -e "${RED}App is not launched. Something went wrong${NC}"
  exit 1
fi








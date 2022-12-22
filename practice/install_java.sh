#!/bin/bash

# return 0 if true, else returns 1
function check_exists() {
  [ -e "$1" ]
}

NC='\033[0m' # No Color
GREEN='\033[0;32m'
# apt-get update

java_dir=/usr/bin/java

if check_exists $java_dir; then
	echo -e "${GREEN}Java is already installed${NC}"
else
	echo -e "${GREEN}Installing Java${NC}"
	apt-get install default-jre -y
	java -version
	echo -e "${GREEN}Java is installed${NC}"
fi

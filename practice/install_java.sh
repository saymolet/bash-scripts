#!/bin/bash

# return 0 if true, else returns 1
function check_exists() {
  [ -e "$1" ]
}

apt-get update

java_dir=/usr/bin/java

if check_exists $java_dir; then
	echo "Java is already installed"
else
	apt-get install default-jre
	java -version
	echo "Java is installed"
fi

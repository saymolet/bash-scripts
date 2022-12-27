#!/bin/bash

TMP_FILE=`mktemp`
RED='\033[0;31m'
NC='\033[0m' # No Color


# Utilize REST API of Nexus and display info about artifacts. Save it to a json to process later
curl -u "$USER_NEXUS":"$USER_NEXUS_PSSWD" -X GET 'http://'$NEXUS_IP_PORT'/service/rest/v1/components?repository='$NEXUS_REPO'&sort=version' | jq "." > artifact.json

if [ -s artifact.json ]; then
  # Get the first (latest) artifact download url
  artifactDownloadUrl=$(jq '.items[0].assets[].downloadUrl' artifact.json --raw-output)
else
  echo -e "${RED}Nexus did not return any information. Please ensure the following: right spelling of the repository name, the nexus user, the nexus password and the presence of artifacts in the repository.${NC}"
  exit 1
fi

# Download the tar file and unpack it
 wget --http-user="$USER_NEXUS" --http-password="$USER_NEXUS_PSSWD" "$artifactDownloadUrl" -O "$TMP_FILE"
 tar -zxvf "$TMP_FILE"

# cd to unpacked dir, run npm install and start the app
 cd package/
 npm install
 node server.js

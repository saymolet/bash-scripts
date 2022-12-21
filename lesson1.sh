#!/bin/bash

file_name=config.yaml
config_dir=$1

# if else statements
if [ -d "$config_dir" ]; then
	echo "reading config directory contents"
	echo "$(ls "$config_dir")"
else
	echo "config dir not found. Creating one"
	mkdir "$config_dir"
	touch "$config_dir"/"lol.txt"
	touch "$config_dir"/"lol2.txt"
fi


user_group=$2


if [ "$user_group" == "vlad" ]; then
	echo "configure the server"
elif [ "$user_group" == "admin" ]; then
	echo "admin server"
else
	echo "no permission to configure"
fi


# echo "using file $file_name to configure something"
# echo "here are all config files: $config_files"


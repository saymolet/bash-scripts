#!/bin/bash


# User input
echo "Reading user input"

read -s -p "Please enter your password: " user_pwd

echo "$user_pwd"

# $* stores all params passed to the script
# $# stores num of params passed to the script
echo "all params: $*"
echo "num of params: $#"

# for loop in bash
for param in $*
  do
    if [ -d "$param" ]; then
      echo "TRUE"
    else
      echo "FALSE"
    fi
  done


# while loops 
sum=0
while [ $sum -lt 20 ]
do
	read -p "enter a score: " score
	
	if [ "$score" == "q" ]; then
		break
	fi

	sum=$(($sum+$score))
	echo "total score: $sum"
done

#!/bin/bash


# User input
echo "Reading user input"

read -s -p "Please enter your password: " user_pwd

echo "$user_pwd"

# $* stores all params passed to the script
# $# stores num of params passed to the script
# echo "all params: $*"
# echo "num of params: $#"

# for loop in bash
for param in $*
  do
    if [ -d "$param" ]; then
      echo "TRUE"
    else
      echo "FALSE"
    fi
  done


# Function
function score_sum {
  
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
}

# Function with passed arguments
function create_file() {
  file_name=$1
  is_shell_script=$2
  touch $file_name 
  echo "file $file_name created"
  
  if [ "$is_shell_script" == true ]; then
	  chmod u+x "$file_name"
	 echo "added execute permission to $file_name" 
  fi

  # returning an argument
}

create_file $1

create_file myfile.yaml

create_file script.sh true

function sum() {
  sum=$(($1+$2))
  echo "added $1 to $2"
  return "$sum"
}


# $? captures the value returned by the last comman
sum 2 10
result=$?
echo "$result"




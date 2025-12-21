#!/usr/bin/env bash

greet () {
	local name=$1 # local keyword scope the variable
	echo "hello $name"
}

for i in "$@"; do 
	greet $i
done

if [[ -n $1 ]]; then
	echo "nice to meet you!!"
else 
	echo "you did not added any argument"
fi

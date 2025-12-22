#!/usr/bin/env bash

array=(foo bar baz)

for i in ${array[@]}; do
        echo "incase of @ $i"
done


for i in ${array[*]}; do
        echo "incase of * $i"
done



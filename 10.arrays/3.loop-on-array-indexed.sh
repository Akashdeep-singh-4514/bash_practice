#!/usr/bin/env bash

array=(foo bar baz)

for i in "${!array[@]}"; do
    echo "$i : ${array[i]}"
done


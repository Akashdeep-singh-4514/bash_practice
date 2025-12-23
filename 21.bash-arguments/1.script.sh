#!/usr/bin/env bash

first_name='dave'
last_name='eddy'

full_name="$first_name $last_name"

if  [[ $first_name == "dave" ]]; then
    echo "hey dave, how are you doing?"
fi

echo "hello $full_name!"

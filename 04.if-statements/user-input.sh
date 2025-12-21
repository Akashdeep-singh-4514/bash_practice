#!/usr/bin/env bash

read -p "Enter your age: " age

# Check if the input is not empty
if [[ -n $age ]]; then
    # Check if the age is 18 or older
    if [[ $age -ge 18 ]]; then
        echo "You are an adult."
    else
        echo "You are a minor."
    fi
else
    echo "No age was entered."
fi
